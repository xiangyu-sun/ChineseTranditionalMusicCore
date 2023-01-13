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
    case .c:
      return "黃鐘"
    case .c where accidental == .sharp:
      return "大呂"
    case .d:
      return "太簇"
    case .d where accidental == .sharp:
      return "夾鐘"
    case .e:
      return "姑洗"
    case .a where accidental == .sharp:
      return "仲呂"
    case .f where accidental == .sharp:
      return "蕤賓"
    case .g:
      return "林鐘"
    case .g where accidental == .sharp:
      return "夷則"
    case .a:
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
