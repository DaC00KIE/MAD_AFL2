import Foundation

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
    print("From here you can...")
    print("[C]heck your health and state")
    print("[H]eal your wounds with a potion")
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
    player.usePotion()
    looped = true
  }
  
}

func battle(stage: Int){
  // battle goes here
  let enemy = enemyGeneration(stage)
  enemy.displayState()
  print("...", terminator: "")
  returnToContinue()
}

func enemyGeneration(_ stage: Int) -> Enemy{
  switch stage{
    case 1: //forest of trolls
    print("Forest of trolls")
    return Troll(player.level)
    case 2: //mountain of golem
    print("Mountain of Golems")
    return Golem()
    default:
    print("Where even are you")
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