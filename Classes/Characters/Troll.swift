import Foundation

class Troll: Enemy{

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
  }

  convenience init(){
    self.init("Troll", 500, 10, 1)
  }

  convenience init(_ level: Int){
    var starting_range = level - 2
    if starting_range <= 0{
      starting_range = 1
    }
    let end_range = level + 2
    self.init("Troll", 500, 10, Int.random(in: starting_range...end_range))
  }

  override func getDamage() -> Damage{
    var damage = Damage(amount: attack + (weapon?.attack ?? 0), element: .normal)
    if(hp <= maxHp/2){
      damage.amount = damage.amount/2*3
    }
    return damage
  }

  override func scanVitals(){
    vitalsScanned = true
    print("The troll will deal 1.5x damage when his health goes below 50%")
  }
}