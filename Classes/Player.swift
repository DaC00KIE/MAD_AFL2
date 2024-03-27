import Foundation

class Player{
  var name: String
  var hp: Int
  var attack: Int
  var level: Int
  var maxHp: Int
  var money: Int
  var mp: Int
  var maxMp: Int
  var potions: Int
  var elixirs: Int
  var shield: Bool = false
  var weapon: Weapon?
  var isDead: Bool = false

  init(_ name: String){
    self.name = name
    maxHp = 100
    hp = maxHp
    attack = 0
    maxMp = 100
    mp = maxMp
    potions = 10
    elixirs = 5
    level = 1
    self.money = 500
  }

  func currentHealth() -> String{
    return String("\(hp)/ \(maxHp)")
  }

  func displayState(){
    print("\nPlayer name: \(name)\n")

    print("HP: \(hp)/ \(maxHp)")
    print("MP: \(mp)/ \(maxMp)\n")

    print("Magic:")
    print("- Physical Attack. No mana required. Deal \(attack)pt of damage.")
    print("- Meteor. Use 50pt of mana. Deal 50pt of damage.")
    print("- Shield. Use 10pt of mana. Block enemy attack for 1 turn.")

    print("\nItems:")
    print("- Potion x\(potions). Heal 20pt of your HP")
    print("- Elixir x\(elixirs). Add 10pt of your MP\n")
  }
 
  func equip(_ weapon: Weapon?){
    if weapon != nil{
      attack -= self.weapon!.attack
    }
    attack += weapon?.attack ?? 0
    self.weapon = weapon
  }

  func takeDamage(_ damage: Int){
    hp -= damage
    if(hp <= 0){
      hp = 0
      isDead = true
    }
  }

  func usePotion(){
    potions -= 1
    hp += 20
    if hp >= maxHp{
      hp = maxHp
    }
  }

}