import Foundation

class Golem: Enemy{

  override init(_ name: String? = "Unnamed", _ hp: Int? = 1000, _ level: Int? = 1){
    super.init(name, hp, level)
    self.name = name ?? "Unnamed"
    self.hp = hp ?? 1000
    self.level = level ?? 1
  }

  override func takeDamage(_ damage: Int){
    hp -= damage/10*9
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  override func vitalsScanned(){
    print("This golem takes 10% less damage due to natural resistance")
  }
}