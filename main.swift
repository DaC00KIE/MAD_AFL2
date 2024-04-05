import Foundation

// for _ in 1...100{
//   let weapon = Weapon.generateRandom(level: 10)
//   weapon.printName()
//   print("")
// }

openingScreen()

let player = Player(registerName())
player.name = player.name.capitalized
print("\nNice to meet you, \(player.name)!\n")

journey()

// ^ swift version of psvm i guess
// --------------------------------------------------
// v functions 

func openingScreen(){

  print("Welcome to the world of magic! 🧙🔮\n")
  print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🗻, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")

  print("\nPress [return] to continue: ", terminator: "")
  returnToContinue()

}

func journey(){
  while(true){
    print("\nFrom here you can...")
    print("[C]heck your health and state")
    print("[H]eal your wounds with a potion")
    print("[R]eplenish your mana with an elixir")
    print("[O]pen a Weapon Box to get a new Weapon")
    print("\n...or choose to go to...\n")
    print("[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit game\n")
    print("Your choice? ", terminator: "")

    var keepLooping = true
    while(keepLooping){
      if let choice = readLine(){
        keepLooping = false
        switch choice.uppercased(){
          case "C":
          checkState()
          case "H":
          healWounds()
          case "R":
          drinkElixir()
          case "O":
          gachaWeapon()
          case "F":
          battle(stage: 1)
          case "M":
          battle(stage: 2)
          case "Q":
          print("Thanks for having played!")
          print("\nPress [return] to exit game: ", terminator: "")
          returnToContinue()
          return
          default:
          print("Your choice? ", terminator: "")
          keepLooping = true
        }
      }
    }
    
  }
}

func checkState(){
  player.displayState()
  print("Press [return] to go back: ", terminator: "")
  returnToContinue()
}

func healWounds(){
  var looped = false

  while(true){
    if(!looped){
      print("\nCurrent Health: \(player.currentHealth())")
      print("You have \(player.potions) potions.\n")
    }else{
      print("\nYour HP is now: \(player.currentHealth())")
      print("You have \(player.potions) potions left.\n")
    }

    if(player.potions == 0){
      print("You don't have any potions to heal your wounds... 😔\n")
      print("press [return] to continue.", terminator: " ")
      returnToContinue()
      return
    }

    if(!looped){
      print("Are you sure you want to use a potion to heal your wound? [Y/ N]", terminator:" ")
    }else{
      print("Would you like to use another potion to heal your wound again? [Y/ N]", terminator: " ")
    }

    let willHeal = isYesOrNo()

    // return if wont heal
    if (!willHeal){
      print("press [return] to go back: ", terminator: "")
      returnToContinue()
      return
    }

    let potion = Potion()
    potion.use(on: player)
    
    looped = true
  }
  
}

func drinkElixir(){
  var looped = false

  while(true){
    if(!looped){
      print("\nCurrent Mana: \(player.currentMana())")
      print("You have \(player.elixirs) elixits.\n")
    }else{
      print("\nYour MP is now: \(player.currentMana())")
      print("You have \(player.elixirs) elixirs left.\n")
    }

    if(player.elixirs == 0){
      print("You don't have any elixirs to replenish your mana... 😔\n")
      print("press [return] to continue.", terminator: " ")
      returnToContinue()
      return
    }

    if(!looped){
      print("Are you sure you want to use a elixir to replenish your mana? [Y/ N]", terminator:" ")
    }else{
      print("Would you like to use another elixir to replenish your mana again? [Y/ N]", terminator: " ")
    }

    let willReplenish = isYesOrNo()

    // return if wont heal
    if (!willReplenish){
      print("press [return] to go back: ", terminator: "")
      returnToContinue()
      return
    }

    let elixir = Elixir()
    elixir.use(on: player)

    looped = true
  }

}

func gachaWeapon(){
  var looped = false

  while(true){
    print("\nWeapon Boxes Owned: \(player.weaponBox)")
    if(player.weaponBox == 0){
      print("You don't have any Weapon Boxes to open... 😔\n")
      print("press [return] to continue.", terminator: " ")
      returnToContinue()
      return
    }

    if(!looped){
      print("Are you sure you want to open a Weapon Box? [Y/ N]", terminator:" ")
    }else{
      print("Would you like to open another Weapon Box? [Y/ N]", terminator: " ")
    }

    let openBox = isYesOrNo()
    print("\n")

    // return if wont heal
    if (!openBox){
      print("press [return] to go back: ", terminator: "")
      returnToContinue()
      return
    }

    let weaponBox = WeaponBox()
    weaponBox.use(on: player)

    print("")

    looped = true
  }

}

func battle(stage: Int){
  // battle goes here
  let enemy = enemyGeneration(stage)

  while(!enemy.isDead && !player.isDead){
    enemy.displayBattleState()
    player.displayBattleState()
    print("Choose your action:")
    player.displayActions(numbered: true)

    print("[4] Use potion to heal wound")
    print("[5] Use elixir to replenish mana")
    print("[6] Scan enemy's vitals")
    print("[7] Flee from battle\n")

    print("Your Choice: ", terminator: "")

    let choice = readLine()
    
    switch choice{
      case "1": //physical attack
      enemy.takeDamage(player.physicalDamage)
      case "2": //meteor
      enemy.takeDamage(player.castMeteor())
      case "3": //shield
      player.castShield()
      case "4": //use potion
      healWounds()
      case "5":
      drinkElixir()
      case "6": //scan vitals
      print("Scanning Enemy Vitals...", terminator: "")
      let _ = readLine()
      enemy.scanVitals()
      case "7": //flee from battle
      print("You have esccaped from battle... Press [enter] to continue,")
      returnToContinue()
      return
      default:
      break
    }
        
    if(!enemy.isDead){
      player.takeDamage(enemy.getDamage())
    }
    player.shield = false
    
  }

  if(enemy.isDead){
    player.defeatedEnemy(enemy)
  }
  player.hp += Int(Double(player.maxHp)*0.2)
  if player.hp >= player.maxHp{
    player.hp = player.maxHp
  }
  player.mp += Int(Double(player.maxMp)*0.2)
  if player.mp >= player.maxMp{
    player.mp = player.maxMp
  }
  print("You've healed 20% of your health and mana back")
}

func enemyGeneration(_ stage: Int) -> Enemy{
  switch stage{
    case 1: //forest of trolls
    print("As you enter the forest, you feel a sense of unease wash over you.")
    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n")
    return Troll.generateNew(playerLevel: player.level)
    case 2: //mountain of golem
    print("As you make through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear a sound that makes you freeze in your tracks, That's when you see it - a massive, snarling Golem emerging from the shadows.\n")
    return Golem.generateNew(playerLevel: player.level)
    default:
    return Enemy()
  }
}

func returnToContinue(){  
  var keepLooping = true
  while(keepLooping){
    if(readLine() == ""){
      print("")
      keepLooping = false
    }
  }
}

func registerName() -> String{
  while(true){
    print("May I know your name, young wizard? ", terminator: "")
    if let name = readLine(){
      if isOnlyCharacters(name){
        print("")
        return name
      }
    }
  }
}

func isOnlyCharacters(_ input: String) -> Bool {
    if(input == ""){
      return false
    }
    let characterSet = CharacterSet.letters
    return input.rangeOfCharacter(from: characterSet.inverted) == nil
}

func isYesOrNo() -> Bool{
  while true {
      guard let input = readLine()?.uppercased() else {
          continue // Continue looping if there's no input
      }

      switch input {
      case "Y":
        return true
      case "N":
        return false
      default:
          break // Ignore other inputs and continue looping
      }
  }
}