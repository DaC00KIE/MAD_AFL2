import Foundation

class Character{

  var name: String
  var hp: Int
  var attack: Int
  var maxHp: Int
  var level: Int
  var isDead: Bool = false
  var weapon: Weapon?
  var element: Element = .normal

  init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    self.name = name
    maxHp = hp
    self.hp = maxHp
    self.attack = attack
    self.level = level
  }

  func currentHealth() -> String{
    return String("\(hp)/ \(maxHp)")
  }

  func getDamage() -> Damage{
    let damage = Damage(amount: attack + (weapon?.attack ?? 0), element: .normal)
    return damage
  }

  func takeDamage(_ damage: Damage){
    hp -= damage.amount
    print("\(name) took [\(damage.element.emoji)] \(damage.amount)pt of damage...", terminator: "")
    let _ = readLine()
    if(hp <= 0){
      hp = 0
      isDead = true
      print("\(name) has died!")
    }
  }

}

struct Damage{
  var amount: Int
  var element: Element
}