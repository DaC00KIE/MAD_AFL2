import Foundation

class Enemy{
  var name: String
  var hp: Int
  var level: Int
  var isDead: Bool = false

  init(_ name: String? = "Unnamed", _ hp: Int? = 1000, _ level: Int? = 1){
    self.name = name!
    self.hp = hp!
    self.level = level!
  }

  func takeDamage(_ damage: Int){
    hp -= damage
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  func vitalsScanned(){
    print("Enemy scanned")
  }
}