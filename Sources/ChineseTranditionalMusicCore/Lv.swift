import ChineseAstrologyCalendar
import MusicTheory

extension Key {

  public static let huangzhong = Key(type: .c)
  public static let dalv = Key(type: .c, accidental: .sharp)
  public static let taichu = Key(type: .d)
  public static let jiazhong = Key(type: .d, accidental: .sharp)
  public static let guxian = Key(type: .e)
  public static let zhonglv = Key(type: .f)
  public static let ruibin = Key(type: .f, accidental: .sharp)
  public static let lingzhong = Key(type: .g)
  public static let yize = Key(type: .g, accidental: .sharp)
  public static let nanlv = Key(type: .a)
  public static let wushe = Key(type: .a, accidental: .sharp)
  public static let yinzhong = Key(type: .b)

  public static let shierLvLv = [
    huangzhong,
    dalv,
    taichu,
    jiazhong,
    guxian,
    zhonglv,
    ruibin,
    lingzhong,
    yize,
    nanlv,
    wushe,
    yinzhong,
  ]

  public static let shierLvLvMonthOrder = [
    taichu,
    jiazhong,
    guxian,
    zhonglv,
    ruibin,
    lingzhong,
    yize,
    nanlv,
    wushe,
    yinzhong,
    huangzhong,
    dalv,
  ]
}

extension Key {
  public var lvlvDescription: String {
    switch type {
    case .c where accidental == .natural:
      return "黃鐘"
    case .c where accidental == .sharp:
      return "大呂"
    case .d where accidental == .natural:
      return "太簇"
    case .d where accidental == .sharp:
      return "夾鐘"
    case .e:
      return "姑洗"
    case .f where accidental == .natural:
      return "仲呂"
    case .f where accidental == .sharp:
      return "蕤賓"
    case .g where accidental == .natural:
      return "林鐘"
    case .g where accidental == .sharp:
      return "夷則"
    case .a where accidental == .natural:
      return "南呂"
    case .a where accidental == .sharp:
      return "無射"
    case .b:
      return "應鐘"
    default:
      fatalError()
    }
  }
}

extension Key {
  /// The 十二律呂 name in the given language. `.zhHant` equals ``lvlvDescription``.
  public func localizedLvlvName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant:
      return lvlvDescription
    case .zhHans:
      return Self.lvlvNames(at: lvlvIndex).hans
    default:
      return Self.lvlvNames(at: lvlvIndex).pinyin
    }
  }

  private var lvlvIndex: Int {
    switch type {
    case .c where accidental == .natural:
      return 0
    case .c where accidental == .sharp:
      return 1
    case .d where accidental == .natural:
      return 2
    case .d where accidental == .sharp:
      return 3
    case .e:
      return 4
    case .f where accidental == .natural:
      return 5
    case .f where accidental == .sharp:
      return 6
    case .g where accidental == .natural:
      return 7
    case .g where accidental == .sharp:
      return 8
    case .a where accidental == .natural:
      return 9
    case .a where accidental == .sharp:
      return 10
    case .b:
      return 11
    default:
      fatalError()
    }
  }

  private static func lvlvNames(at index: Int) -> (hans: String, pinyin: String) {
    let names: [(hans: String, pinyin: String)] = [
      ("黄钟", "Huángzhōng"),
      ("大吕", "Dàlǚ"),
      ("太簇", "Tàicù"),
      ("夹钟", "Jiázhōng"),
      ("姑洗", "Gūxiǎn"),
      ("仲吕", "Zhònglǚ"),
      ("蕤宾", "Ruíbīn"),
      ("林钟", "Línzhōng"),
      ("夷则", "Yízé"),
      ("南吕", "Nánlǚ"),
      ("无射", "Wúyì"),
      ("应钟", "Yìngzhōng"),
    ]
    return names[index]
  }
}
