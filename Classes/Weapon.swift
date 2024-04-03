import Foundation

class Weapon{
  var name: String
  var level: Int
  var attack: Int
  var element: Element

  init(name: String, level: Int, attack: Int, element: Element){
    self.name = name
    self.level = level
    self.attack = attack
    self.element = element
  }

  convenience init(){
    self.init(name: "Wooden Stick", level: 1, attack: 4, element: .normal)
  }
  
}

enum Rarity: String, CaseIterable{
  case common = "COMMON"
  case uncommon = "UNCOMMON"
  case rare = "RARE"
  case epic = "EPIC"
  case legendary = "LEGENDARY"

  func getRandomRarity() -> Rarity{
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
}