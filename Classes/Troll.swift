import Foundation

class Troll: Enemy{

  override init(_ name: String, _ hp: Int, _ level: Int){
    super.init(name, hp, level)
    location = "Forest of Trolls"
  }

  convenience init(){
    self.init("Unnamed Troll", 500, 1)
  }

  convenience init(_ level: Int){
    var starting_range = level - 2
    if starting_range <= 0{
      starting_range = 1
    }
    let end_range = level + 2
    self.init("Unnamed Troll", 500, Int.random(in: starting_range...end_range))
  }

  override func takeDamage(_ damage: Int){
    hp -= damage
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  override func scanVitals(){
    vitalsScanned = true
    print("The troll will deal 1.5x damage when his health goes below 50%")
  }
}