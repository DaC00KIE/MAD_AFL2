import Foundation

class Enemy{
  var name: String
  var hp: Int
  var maxHp: Int
  var level: Int
  var isDead: Bool = false
  var weapon: Weapon?
  var vitalsScanned: Bool = false
  var location: String

  init(_ name: String, _ hp: Int, _ level: Int){
    self.name = name
    maxHp = hp
    self.hp = maxHp
    self.level = level
    self.location = "Unknown Territory"
  }

  func displayState(){
    print("===== \(location.uppercased()) =====")
    print("\(name) Lv. \(level)")
    print("HP: \(currentHealth())")
    let length = location.count + 12
    for _ in 1...length{
      print("=", terminator: "")
    }
    print("")
  }

  convenience init(){
    self.init("Unnamed Enemy", 100, 1)
  }

  func currentHealth() -> String{
    return String("\(hp)/ \(maxHp)")
  }

  func takeDamage(_ damage: Int){
    hp -= damage
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  func scanVitals(){
    print("Enemy scanned")
  }
}