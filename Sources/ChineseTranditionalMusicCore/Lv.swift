import ChineseAstrologyCalendar
import MusicTheory

/// 奇数各律称 “律”，偶数各律称“吕”
public enum 律呂: Int, CaseIterable, YinYangIdentifiable {
  case 黃鐘 = 1
  case 大呂
  case 太簇
  case 夾鐘
  case 姑洗
  case 仲呂
  case 蕤賓
  case 林鐘
  case 夷則
  case 南呂
  case 無射
  case 應鐘
  
  public var key: Key {
    switch self {
    case .黃鐘:
      return Key(type: .c)
    case .大呂:
      return Key(type: .g)
    case .太簇:
      return Key(type: .d)
    case .夾鐘:
      return Key(type: .a)
    case .姑洗:
      return Key(type: .e)
    case .仲呂:
      return Key(type: .b)
    case .蕤賓:
      return Key(type: .f, accidental: .sharp)
    case .林鐘:
      return Key(type: .c, accidental: .sharp)
    case .夷則:
      return Key(type: .g, accidental: .sharp)
    case .南呂:
      return Key(type: .d, accidental: .sharp)
    case .無射:
      return Key(type: .a, accidental: .sharp)
    case .應鐘:
      return Key(type: .f)
    }
  }

  public var dizhi: Dizhi {
    switch self {
    case .黃鐘:
      return .yin
    case .大呂:
      return .mao
    case .太簇:
      return .chen
    case .夾鐘:
      return .si
    case .姑洗:
      return .wu
    case .仲呂:
      return .wei
    case .蕤賓:
      return .shen
    case .林鐘:
      return .you
    case .夷則:
      return .xu
    case .南呂:
      return .hai
    case .無射:
      return .zi
    case .應鐘:
      return .chou
    }
  }

}
