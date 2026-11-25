import ChineseAstrologyCalendar
import MusicTheory

// MARK: - 階名

extension Key {

  public static let gong = Key(type: .c)
  public static let shang = Key(type: .d)
  public static let jue = Key(type: .e)
  public static let qingjue = Key(type: .f)
  public static let bianhui = Key(type: .f, accidental: .sharp)
  public static let wei = Key(type: .g)
  public static let qingyu = Key(type: .a, accidental: .sharp)
  public static let yu = Key(type: .a)
  public static let biangong = Key(type: .b)

  public static let wuyin = [gong, shang, jue, wei, yu]
  public static let qishen = [gong, shang, jue, qingyu, wei, yu, biangong]
}

extension Key {
  public var wuxing: Wuxing {
    switch type {
    case .c:
      return .earth
    case .d:
      return .metal
    case .e:
      return .wood
    case .g:
      return .fire
    case .a:
      return .water
    default:
      fatalError()
    }
  }

  public var wuyinChineseName: String {
    switch type {
    case .c:
      return "宮"
    case .d:
      return "商"
    case .e:
      return "角"
    case .g:
      return "徵"
    case .a:
      return "羽"
    default:
      fatalError()
    }
  }

  public var wuyinTangDynastySymbol: String {
    switch type {
    case .c:
      return "合"
    case .d:
      return "四"
    case .e:
      return "乙"
    case .g:
      return "尺"
    case .a:
      return "工"
    default:
      fatalError()
    }
  }
}

extension Key {
  public var qiShenChineseName: String {
    switch type {
    case .c:
      return "宮"
    case .d:
      return "商"
    case .e:
      return "角"
    case .f where accidental == .natural:
      return "清角"
    case .f where accidental == .sharp:
      return "變徵"
    case .g:
      return "徵"
    case .a where accidental == .sharp:
      return "清羽"
    case .a where accidental == .natural:
      return "羽"
    case .b:
      return "變宮"
    default:
      fatalError()
    }
  }
}

extension Key {
  /// The 五音 name in the given language. `.zhHant` equals ``wuyinChineseName``.
  ///
  /// `.en`, `.es` and every other non-Chinese language use Pinyin with tone
  /// marks, e.g. "Gōng".
  public func localizedWuyinName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant:
      return wuyinChineseName
    case .zhHans:
      return type == .c ? "宫" : wuyinChineseName // 商角徵羽 are identical in both scripts
    default:
      switch type {
      case .c: return "Gōng"
      case .d: return "Shāng"
      case .e: return "Jué"
      case .g: return "Zhǐ"
      case .a: return "Yǔ"
      default: fatalError()
      }
    }
  }

  /// The 七聲 name in the given language. `.zhHant` equals ``qiShenChineseName``.
  ///
  /// `.en`, `.es` and every other non-Chinese language use Pinyin with tone
  /// marks, e.g. "Biàngōng".
  public func localizedQiShenName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant:
      return qiShenChineseName
    case .zhHans:
      switch type {
      case .c: return "宫"
      case .f where accidental == .sharp: return "变徵"
      case .b: return "变宫"
      default: return qiShenChineseName
      }
    default:
      switch type {
      case .c: return "Gōng"
      case .d: return "Shāng"
      case .e: return "Jué"
      case .f where accidental == .natural: return "Qīngjué"
      case .f where accidental == .sharp: return "Biànzhǐ"
      case .g: return "Zhǐ"
      case .a where accidental == .sharp: return "Qīngyǔ"
      case .a where accidental == .natural: return "Yǔ"
      case .b: return "Biàngōng"
      default: fatalError()
      }
    }
  }
}

// MARK: - 變

public enum 變 {
  case 清
  case 變
}

extension 變: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch (self, language) {
    case (.清, .zhHant), (.清, .zhHans): return "清"
    case (.變, .zhHant): return "變"
    case (.變, .zhHans): return "变"
    case (.清, _): return "Qīng"
    case (.變, _): return "Biàn"
    }
  }
}
