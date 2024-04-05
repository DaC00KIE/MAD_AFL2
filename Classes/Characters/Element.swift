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

  static func getDamageMultiplier(damage: Element, target: Element) -> Double{
    var multiplier = 1.0
    switch damage{
      case .fire:
      if target == .water{
        multiplier = 0.75
      }
      if target == .grass{
        multiplier = 1.5
      }
      case .water:
      if target == .grass{
        multiplier = 0.75
      }
      if target == .fire{
        multiplier = 1.5
      }
      case .grass:
      if target == .fire{
        multiplier = 0.75
      }
      if target == .water{
        multiplier = 1.5
      }
      default:
      multiplier = 1.0
    }

    return multiplier
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