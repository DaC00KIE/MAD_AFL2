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
    self.weapon = Weapon()
  }

  convenience init(_ name: String){
    self.init(name, 100, 100, 1)
  }

  func attack_physical() -> Damage{
    let damage = Damage(amount: getDamage().amount, element: .normal)
    return damage
  }

  func summon_meteor() -> Damage{
    mp -= 15
    return spell_meteor()
  }

  func summon_shield(){
    mp -= 10
    spell_shield()
  }

  func spell_meteor() -> Damage{
    let damage = Damage(amount: 50 + getDamage().amount, element: weapon?.element ?? .normal)
    return damage
  }

  func spell_shield(){
    shield = true
  }

  override func takeDamage(_ damage: Damage){
    if(shield){
      print("Your shield absorbed the damage!")
      shield = false
      return
    }
    hp -= damage.amount
    print("\(name) took [\(damage.element.emoji())] \(damage.amount)pt of damage...", terminator: "")
    let _ = readLine()
    if(hp <= 0){
      hp = 0
      isDead = true
      print("\(name) has died!")
    }
  }

  func displayActions(){
    print("- Physical Attack. No mana required. Deal \(getDamage())pt of damage.")
    print("- Meteor [\(weapon!.element)]. Use 15pt of mana. Deal \(spell_meteor().amount)pt of damage.")
    print("- Shield. Use 10pt of mana. Block enemy attack for 1 turn.")
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

    displayActions()

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