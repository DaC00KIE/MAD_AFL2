import Foundation

class Character{

  var name: String
  var hp: Int
  var attack: Int
  var maxHp: Int
  var level: Int
  var isDead: Bool = false
  var weapon: Weapon
  var element: Element = .normal

  init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    self.name = name
    maxHp = hp
    self.hp = maxHp
    self.attack = attack
    self.level = level
    self.weapon = Weapon(level: self.level)
  }

  func currentHealth() -> String{
    return String("\(hp)/ \(maxHp)")
  }

  func getDamage() -> Damage{
    let damage = Damage(rawAmount: Double(attack + weapon.attack), element: self.element)
    return damage
  }

  func takeDamage(_ damage: Damage){
    if(damage.amount == 0){
      print("")
      return
    }
    let damageMultiplier = Element.getDamageMultiplier(damage: damage.element, target: self.element)

    let modifiedDamage = Int(damage.rawAmount * damageMultiplier)
    hp -= modifiedDamage
    
    print("\(name) took [\(damage.element.emoji)] \(modifiedDamage)pt of damage...", terminator: "")
    let _ = readLine()
    if(hp <= 0){
      hp = 0
      isDead = true
      print("\(name) has died!")
    }
  }

}

struct Damage{
  var rawAmount: Double
  var element: Element
  var amount: Int{
    return Int(rawAmount)
  }
}