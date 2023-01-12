import ChineseAstrologyCalendar
import MusicTheory

// MARK: - LvLv

public struct LvLv: ExpressibleByIntegerLiteral, CustomStringConvertible {

  // MARK: Lifecycle

  public init(integerLiteral value: Int) {
    lvlvType = 律呂(rawValue: value) ?? .仲呂
  }

  // MARK: Public

  public typealias IntegerLiteralType = Int

  public let lvlvType: 律呂

  public var key: Key {
    switch lvlvType {
    case .黃鐘:
      return Key(type: .c)
    case .林鐘:
      return Key(type: .g)
    case .太簇:
      return Key(type: .d)
    case .南呂:
      return Key(type: .a)
    case .姑洗:
      return Key(type: .e)
    case .應鐘:
      return Key(type: .b)
    case .蕤賓:
      return Key(type: .f, accidental: .sharp)
    case .大呂:
      return Key(type: .c, accidental: .sharp)
    case .夷則:
      return Key(type: .g, accidental: .sharp)
    case .夾鐘:
      return Key(type: .d, accidental: .sharp)
    case .無射:
      return Key(type: .a, accidental: .sharp)
    case .仲呂:
      return Key(type: .f)
    }
  }

  public var description: String {
    switch lvlvType {
    case .黃鐘:
      return "黃鐘"
    case .大呂:
      return "大呂"
    case .太簇:
      return "太簇"
    case .夾鐘:
      return "夾鐘"
    case .姑洗:
      return "姑洗"
    case .仲呂:
      return "仲呂"
    case .蕤賓:
      return "蕤賓"
    case .林鐘:
      return "林鐘"
    case .夷則:
      return "夷則"
    case .南呂:
      return "南呂"
    case .無射:
      return "無射"
    case .應鐘:
      return "應鐘"
    }
  }
}

// MARK: - 律呂

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
  

  public var dizhi: Dizhi {
    switch self {
    case .黃鐘:
      return .zi
    case .大呂:
      return .chou
    case .太簇:
      return .yin
    case .夾鐘:
      return .mao
    case .姑洗:
      return .chen
    case .仲呂:
      return .si
    case .蕤賓:
      return .wu
    case .林鐘:
      return .you
    case .夷則:
      return .wei
    case .南呂:
      return .shen
    case .無射:
      return .chou
    case .應鐘:
      return .wu
    }
  }

}
