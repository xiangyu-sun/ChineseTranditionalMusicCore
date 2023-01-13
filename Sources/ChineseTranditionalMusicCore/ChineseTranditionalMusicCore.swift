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
      return .tu
    case .d:
      return .jin
    case .e:
      return .mu
    case .g:
      return .huo
    case .a:
      return .shui
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

// MARK: - 變

public enum 變 {
  case 清
  case 變
}
