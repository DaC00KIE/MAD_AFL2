import Foundation

class Weapon{
  var name: String
  var level: Int
  var attack: Int

  init(_ name: String? = "Unnamed", _ level: Int? = 1){
    self.name = name ??  "Unnamed"
    self.level = level ?? 1
    if(name == "Bare hands"){
      attack = 5
    }else{
      attack = level ?? 1 * Int.random(in: 1...5)
    }
  }
  
}