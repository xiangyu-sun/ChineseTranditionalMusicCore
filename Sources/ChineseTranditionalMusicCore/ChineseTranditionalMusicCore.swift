public enum 階名 {
    case 宮
    case 商
    case 角
    case 徵
    case 羽
}

public enum 變聲 {
    case 清(階名)
    case 變(階名)
    
    static let 清角 = 變聲.清(.角)
    static let 變徵 = 變聲.變(.徵)
    static let 清羽 = 變聲.清(.羽)
    static let 變宮 = 變聲.清(.宮)
}
