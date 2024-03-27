import Foundation

class Player: Character{

  var money: Int
  var mp: Int
  var maxMp: Int
  var potions: Int
  var elixirs: Int
  var shield: Bool = false

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    self.money = 500
    self.maxMp = 100
    self.mp = self.maxMp
    self.potions = 10
    self.elixirs = 5
    super.init(name, hp, attack, level)
  }

  convenience init(_ name: String){
    self.init(name, 100, 100, 1)
    self.money = 500
  }

  func displayBattleState(){
    print("\nPlayer: \(name)")
    print("HP: \(hp)/ \(maxHp)")
    print("MP: \(mp)/ \(maxMp)\n")
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

  func usePotion(){
    potions -= 1
    hp += 20
    if hp >= maxHp{
      hp = maxHp
    }
  }

}