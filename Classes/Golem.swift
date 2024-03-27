import Foundation

class Golem: Enemy{

  override init(_ name: String, _ hp: Int, _ level: Int){
    super.init(name, hp, level)
    location = "Mountain of Golems"
  }

  convenience init(){
    self.init("Unnamed Golem", 1000, 1)
  }
  
  override func takeDamage(_ damage: Int){
    hp -= damage/10*9
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  override func scanVitals(){
    vitalsScanned = true
    print("This golem takes 10% less damage due to natural resistance")
  }
}