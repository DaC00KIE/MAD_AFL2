import Foundation

class Player: Character{

  var gold: Int
  var mp: Int
  var maxMp: Int
  var potions: Int
  var elixirs: Int
  var shield: Bool = false
  var xpNeeded: Int
  var xp: Int

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    self.gold = 100
    self.maxMp = 100
    self.mp = self.maxMp
    self.potions = 10
    self.elixirs = 5
    self.xpNeeded = 1
    self.xp = 0
    super.init(name, hp, attack, level)
    self.weapon = Weapon(level: 1)
    
  }

  convenience init(_ name: String){
    self.init(name, 100, 5, 1)
  }

  func gainXp(_ xp: Int){
    self.xp += xp
    print("+\(xp) XP!")
    while xp >= xpNeeded {
      self.xp -= xpNeeded
      levelUp()
    }
  }

  func gainGold(enemyLevel: Int){
    let goldGain = 20 + (enemyLevel*10)
    self.gold += goldGain
    print("+\(goldGain) Gold!")
  }

  func gainLoot(enemy: Enemy){
    let chance = Int.random(in: 1...100)

    if chance <= 25+enemy.level{
      
      print("Wow! You've discovered a ]!")
    }
    
  }

  func defeatedEnemy(enemy: Enemy){
    print("You've defeated a Lv. \(enemy.level) \(enemy.name) [\(enemy.element.emoji)]!\n")
    gainXp(enemy.level)
    gainGold(enemyLevel: enemy.level)
    gainLoot(enemy: enemy)
    
  }

  func levelUp(){
    level += 1
    attack += 2
    hp += 5
    maxHp += 5
    xpNeeded += 1

    print("\nYou've leveled up! You are now level \(level)")
    print("Attack +2\nHealth +5\n")
    print("XP: \(xp)/ \(xpNeeded)")
  }

  // spells
  var meteorDamage: Damage{
    return Damage(rawAmount: 50 + getDamage().rawAmount, element: weapon?.element ?? .normal)
  }

  var physicalDamage: Damage{
    return Damage(rawAmount: getDamage().rawAmount, element: .normal)
  }

  func castMeteor() -> Damage{
    mp -= 15
    return meteorDamage
  }

  func castShield(){
    mp -= 10
    shield = true
  }

  override func takeDamage(_ damage: Damage){
    if(shield){
      print("Your shield absorbed the incoming damage!")
      shield = false
      return
    }
    hp -= damage.amount
    print("\(name) took [\(damage.element.emoji)] \(damage.amount)pt of damage...", terminator: "")
    let _ = readLine()
    if(hp <= 0){
      hp = 0
      isDead = true
      print("\(name) has died!")
    }
  }

  func displayActions(numbered: Bool){
    if(numbered){
      print("[1] ", terminator: "")
    }else{
      print("- ", terminator: "")
    }
    print("Physical Attack. No mana required. Deal \(getDamage().amount)pt of damage.")
    if(numbered){
      print("[1] ", terminator: "")
    }else{
      print("- ", terminator: "")
    }
    print("Meteor [\(weapon!.element)]. Use 15pt of mana. Deal \(meteorDamage.amount)pt of damage.")
    if(numbered){
      print("[1] ", terminator: "")
    }else{
      print("- ", terminator: "")
    }
    print("Shield. Use 10pt of mana. Block enemy attack for 1 turn.")
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

    displayActions(numbered: false)

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

}

