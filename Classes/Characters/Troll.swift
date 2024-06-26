import Foundation

class Troll: Enemy{

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
  }

  convenience init(){
    self.init("Troll", 300, 10, 1)
    self.element = Element.getRandomElement()
  }

  convenience init(_ level: Int){
    var starting_range = level - 2
    if starting_range <= 0{
      starting_range = 1
    }
    let end_range = level + 2
    self.init("Troll", 300, 10, Int.random(in: starting_range...end_range))
    self.element = Element.getRandomElement()
  }

  override func levelUp(){
    self.attack += 5
    self.hp += 10
    self.maxHp += 10
  }

  static func generateNew(playerLevel: Int) -> Enemy{
    let enemy = Troll(playerLevel)
    for _ in 1...enemy.level{
      enemy.levelUp()
    }
    return enemy
  }

  override func getDamage() -> Damage{
    var damage = Damage(rawAmount: Double(attack + weapon.attack), element: self.element)
    if(hp <= maxHp/2){
      damage.rawAmount = damage.rawAmount * 1.5
    }
    return damage
  }

  override func scanVitals(){
    vitalsScanned = true
    print("The troll will deal 1.5x damage when his health goes below 50%")
  }
}