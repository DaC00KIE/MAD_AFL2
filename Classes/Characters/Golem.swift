import Foundation

class Golem: Enemy{

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
  }

  convenience init(){
    self.init("Golem", 600, 5, 1)
  }

  convenience init(_ level: Int){
    var starting_range = level - 2
    if starting_range <= 0{
      starting_range = 1
    }
    let end_range = level + 2
    self.init("Golem", 600, 5, Int.random(in: starting_range...end_range))
    self.element = Element.getRandomElement()
  }

  override func levelUp(){
    self.level += 1
    self.attack += 3
    self.hp += 20
    self.maxHp += 20
  }

  static func generateNew(playerLevel: Int) -> Enemy{
    let enemy = Golem(playerLevel)
    for _ in 1...enemy.level{
      enemy.levelUp()
    }
    return enemy
  }
  
  override func takeDamage(_ damage: Damage){
    if damage.amount == 0{
      print("")
      return
    }
    let damageMultiplier = Element.getDamageMultiplier(damage: damage.element, target: self.element)

    let modifiedDamage = Int(damage.rawAmount * damageMultiplier * 0.9)
    hp -= modifiedDamage
    
    print("\(name) took [\(damage.element.emoji)] \(modifiedDamage)pt of damage")
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