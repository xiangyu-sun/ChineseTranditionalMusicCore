import ChineseAstrologyCalendar

public enum 律呂: String, CaseIterable {
    case 黃鐘
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
  
  var dizhi: Dizhi {
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
