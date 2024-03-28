import Foundation

class Golem: Enemy{

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
  }

  convenience init(){
    self.init("Golem", 1000, 5, 1)
  }
  
  override func takeDamage(_ damage: Int){
    hp -= damage/10*9
    print("\(name) took \(damage)pt of damage")
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