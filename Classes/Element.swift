enum Element: String, CaseIterable{
  case fire = "FIRE"
  case water = "WATER"
  case grass = "GRASS"
  case light = "LIGHT"
  case dark = "DARK"
  case normal = "NORMAL"

  func elementEmoji() -> String{
      switch self{
        case .fire:
          return "🔥"
        case .water:
          return "💧"
        case .grass:
          return "🌱"
        case .light:
          return "✨"
        case .dark:
          return "🌑"
        case .normal:
          return "✊"
      }
  }
}