import Foundation

struct Weapon{
  var name: String{
    switch element{
      case .normal:
      return "Mage wand"
      case .fire:
      return "Flame wand"
      case .water:
      return "Hydro wand"
      case .grass:
      return "Floral wand"
    }
  }
  var coloredName: String{
    var name: String = ""
    switch element{
      case .normal: name += "\u{001B}[0;37m"
      case .fire: name += "\u{001B}[0;31m"
      case .water: name += "\u{001B}[0;94m"
      case .grass: name += "\u{001B}[0;32m"
    }
    return name + self.name + "\u{001B}[0;0m"
  }
  var level: Int
  var attack: Int{
    var attackStartRange = 0
    var attackEndRange = 0
    switch rarity{
      case .common:
        attackStartRange = 1
        attackEndRange = 5
      case .uncommon:
        attackStartRange = 6
        attackEndRange = 10
      case .rare: 
        attackStartRange = 11
        attackEndRange = 15
      case .epic: 
        attackStartRange = 16
        attackEndRange = 25
      case .legendary: 
        attackStartRange += 25 
        attackEndRange += 40
    }

    return Int.random(in: attackStartRange...attackEndRange) + (level*3)
  }
  var element: Element = Element.getRandomElement()
  var rarity: Rarity = Rarity.getRandomRarity()
  
  var price: Int{
    var cost = 0
    if element == .normal{
      cost -= 50
    }
    switch rarity{
      case .common: cost += 100
      case .uncommon: cost += 200
      case .rare: cost += 300
      case .epic: cost += 400
      case .legendary: cost += 500
    }
    return cost
  }

  init(level: Int){
    self.level = level
  }

  init(randomizedAround: Int){
    var levelStartRange = randomizedAround-5
    if levelStartRange <= 1{
      levelStartRange = 1
    }
    let levelEndRange = randomizedAround+5
    self.level = Int.random(in: levelStartRange...levelEndRange)
  }

  static func generateRandom(playerLevel: Int) -> Weapon{
    return self.init(randomizedAround: playerLevel)
  }

  static func generateType(_ element: Element, playerLevel: Int) -> Weapon{
    
    var weapon = self.init(randomizedAround: playerLevel)
    switch element{
      case .fire:
      weapon.element = .fire
      case .water:
      weapon.element = .water
      case .grass:
      weapon.element = .grass
      default:
      weapon.element = .normal
    }

    return weapon
  }

}

enum Rarity: String, CaseIterable{
  case common = "Common"
  case uncommon = "Uncommon"
  case rare = "Rare"
  case epic = "Epic"
  case legendary = "Legendary"

  var symbol: String{
    switch self{
      case .common: return "[C]"
      case .uncommon: return "[UC]"
      case .rare: return "[R]"
      case .epic: return "[E]"
      case .legendary: return "[L]"
    }
  }

  var coloredSymbol: String{
    return colorCode + self.symbol + resetCode
  }

  var coloredName: String{
    return colorCode + self.rawValue + resetCode
  }

  static func getRandomRarity() -> Rarity{
    let chance = Int.random(in: 1...100)

    if chance <= 3{
      return .legendary
    }else if chance <= 10{
      return .epic
    }else if chance <= 25{
      return .rare
    }else if chance <= 50{
      return .uncommon
    }else{
      return .common
    }
  }

  var colorCode: String {
      switch self {
      case .common:
          return "\u{001B}[1;30m"  // Gray
      case .uncommon:
          return "\u{001B}[0;32m"  // Green
      case .rare:
          return "\u{001B}[0;34m"  // Blue
      case .epic:
          return "\u{001B}[0;35m"  // Purple
      case .legendary:
          return "\u{001B}[0;33m"  // Orange
      }
  }
  
  var resetCode: String {
      return "\u{001B}[0;0m"  // Reset color
  }
}