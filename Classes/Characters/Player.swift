import Foundation

class Player: Character{

  // var gold: Int
  var mp: Int
  var maxMp: Int
  var potions: Int
  var elixirs: Int
  var weaponBox: Int
  var shield: Bool = false
  var xpNeeded: Int
  var xp: Int

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    // self.gold = 100
    self.maxMp = 120
    self.mp = self.maxMp
    self.potions = 10
    self.elixirs = 5
    self.weaponBox = 3
    self.xpNeeded = 1
    self.xp = 0
    super.init(name, hp, attack, level)
    self.weapon = Weapon(level: 1)
    self.weapon.setAttack()
  }

  convenience init(_ name: String){
    self.init(name, 150, 5, 1)
  }

  func currentMana() -> String{
    return "\(self.mp)/ \(self.maxMp)"
  }

  func gainXp(_ xp: Int){
    self.xp += xp
    print("+\(xp) XP!")
    while self.xp >= self.xpNeeded {
      self.xp -= self.xpNeeded
      levelUp()
    }
  }

  // func gainGold(enemyLevel: Int){
  //   let goldGain = 20 + (enemyLevel*10)
  //   self.gold += goldGain
  //   print("+\(goldGain) Gold!")
  // }

  func gainLoot(enemy: Enemy){
    let chance = Int.random(in: 1...100)

    if chance <= 25+enemy.level{
      print("\nWow! You've discovered a Weapon Box!")
      print("Weapon Box +1")
      weaponBox += 1
      
    }
    
  }

  func defeatedEnemy(_ enemy: Enemy){
    print("You've defeated a Lv. \(enemy.level) \(enemy.name) [\(enemy.element.emoji)]!\n")
    gainXp(enemy.level)
    // gainGold(enemyLevel: enemy.level)
    gainLoot(enemy: enemy)
    print("Potions +1\nElixirs +1")
    potions += 1
    elixirs += 1
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
    print("press [return] to continue.")
    var keepLooping = true
    while(keepLooping){
      if(readLine() == ""){
        print("")
        keepLooping = false
      }
    }
  }

  // spells
  var meteorDamage: Damage{
    return Damage(rawAmount: 50 + getDamage().rawAmount, element: weapon.element)
  }

  var physicalDamage: Damage{
    return Damage(rawAmount: getDamage().rawAmount, element: .normal)
  }

  func castMeteor() -> Damage{
    if(mp < 15){
      print("\(name) doesn't have enough mana for a meteor!")
      return Damage(rawAmount: 0, element: .normal)
    }
    mp -= 15
    return meteorDamage
  }

  func castShield(){
    if mp < 10{
      print("\(name) doesn't have enough mana for a shield!")
      return
    }
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

  func displayInv(){
    print("Items:")
    print("Potions: x\(potions). Heal 20% of your HP")
    print("Elixirs: x\(elixirs). Add 20% of your MP")    
    print("Weapon: \(weapon.coloredName) Lv. \(weapon.level) \(weapon.rarity.coloredSymbol) | ATK: \(weapon.attack)\n")
  }

  func displayActions(numbered: Bool){
    if(numbered){
      print("[1] ", terminator: "")
    }else{
      print("- ", terminator: "")
    }
    print("Physical Attack. No mana required. Deal \(getDamage().amount)pt of damage.")
    if(numbered){
      print("[2] ", terminator: "")
    }else{
      print("- ", terminator: "")
    }
    print("Meteor [\(weapon.element.emoji)]. Use 15pt of mana. Deal \(meteorDamage.amount)pt of damage.")
    if(numbered){
      print("[3] ", terminator: "")
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

    print("Level: \(level)")
    print("HP: \(hp)/ \(maxHp)")
    print("MP: \(mp)/ \(maxMp)\n")

    print("Magic:")

    displayActions(numbered: false)

    displayInv()
  }
 
  func equip(_ weapon: Weapon){
    attack -= self.weapon.attack
    attack += weapon.attack
    self.weapon = weapon
  }

}

