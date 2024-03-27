import Foundation

class Character{

  var name: String
  var hp: Int
  var attack: Int
  var maxHp: Int
  var level: Int
  var isDead: Bool = false
  var weapon: Weapon?

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

  func getDamage() -> Int{
    return attack + (weapon?.attack ?? 0)
  }

  func takeDamage(_ damage: Int){
    hp -= damage
    print("\(name) took \(damage)pt of damage...", terminator: "")
    let _ = readLine()
    if(hp <= 0){
      hp = 0
      isDead = true
      print("\(name) has died!")
    }
  }
  
}