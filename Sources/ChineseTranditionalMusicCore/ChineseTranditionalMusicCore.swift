import ChineseAstrologyCalendar
import MusicTheory

// MARK: - 階名

public enum 階名: Int, CaseIterable, ExpressibleByIntegerLiteral {

  case 宮 = 1
  case 商
  case 角
  case 徵
  case 羽

  // MARK: Lifecycle

  public init(integerLiteral value: Int) {
    self = 階名(rawValue: value) ?? 階名.宮
  }

  // MARK: Public

  public typealias IntegerLiteralType = Int

  public var key: Key {
    switch self {
    case .宮:
      return Key(type: .c)
    case .商:
      return Key(type: .d)
    case .角:
      return Key(type: .e)
    case .徵:
      return Key(type: .g)
    case .羽:
      return Key(type: .a)
    }
  }

  public var wuxing: Wuxing {
    switch self {
    case .宮:
      return .tu
    case .商:
      return .jin
    case .角:
      return .mu
    case .徵:
      return .huo
    case .羽:
      return .shui
    }
  }

  public var tangDynastySymbol: String {
    switch self {
    case .宮:
      return "合"
    case .商:
      return "四"
    case .角:
      return "乙"
    case .徵:
      return "尺"
    case .羽:
      return "工"
    }
  }
}

// MARK: - 變聲

public enum 變聲 {
  case 清(階名)
  case 變(階名)

  // MARK: Public

  public var key: Key {
    switch self {
    case .清(let name):
      switch name {
      case .角:
        return Key(type: .f)

      case .羽:
        return Key(type: .a, accidental: .sharp)

      default:
        fatalError()
      }

    case . 變(let name):
      switch name {
      case .宮:
        return Key(type: .b)

      case .徵:
        return Key(type: .f, accidental: .sharp)

      default:
        fatalError()
      }
    }
  }

  // MARK: Internal

  static let 清角 = 變聲.清(.角)
  static let 變徵 = 變聲.變(.徵)
  static let 清羽 = 變聲.清(.羽)
  static let 變宮 = 變聲.變(.宮)
}
