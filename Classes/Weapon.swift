import Foundation

class Weapon{
  var name: String
  var level: Int
  var attack: Int

  init(_ name: String? = "Unnamed", _ level: Int? = 1){
    self.name = name
    self.level = level
    attack = level * Int(random(in: 1...5))
  }
  
}