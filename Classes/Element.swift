enum Element: String, CaseIterable{
  case fire = "FIRE"
  case water = "WATER"
  case grass = "GRASS"
  case normal = "NORMAL"

  var emoji: String{
      switch self{
        case .fire:
          return "🔥"
        case .water:
          return "💧"
        case .grass:
          return "🌱"
        case .normal:
          return "✊"
      }
  }

  static func getRandomElement() -> Element{
    // 50% chance normal 50% the rest
    let normal = Int.random(in: 1...2)
    if normal == 1{
      return .normal
    }

    let element = Int.random(in: 1...3)
    switch element{
      case 1: return .fire
      case 2: return .water
      default: return .grass
    }
  }

}