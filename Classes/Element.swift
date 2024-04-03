enum Element: String, CaseIterable{
  case fire = "FIRE"
  case water = "WATER"
  case grass = "GRASS"
  case normal = "NORMAL"
  case block = "BLOCK"

  func emoji() -> String{
      switch self{
        case .fire:
          return "🔥"
        case .water:
          return "💧"
        case .grass:
          return "🌱"
        case .normal:
          return "✊"
        case .block:
          return "🛡️"
      }
  }

}