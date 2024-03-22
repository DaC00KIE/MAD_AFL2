import Foundation

print("before opening")
openingScreen()
print("after opening")

let player = Player(registerName())
player.name = player.name.capitalized
print("\nNice to meet you, \(player.name)!")

journeyScreen()

// --------------------------------------------------

func openingScreen(){

  print("Welcome to the world of magic! 🧙🔮\n")
  print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🗻, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")

  print("\nPress [return] to continue: ", terminator: "")
  returnToContinue()

}

func registerName() -> String{
  let keepLooping = true
  while(keepLooping){
    print("May I know your name, young wizard? ", terminator: "")
    if let name = readLine(){
      if isNameValid(name){
        return name
      }
    }
  }
}

func journeyScreen(){
  while(true){
    print("From here you can...")
    print("[C]heck your health and state")
    print("[H]eal your wounds with a potion")
    print("\n...or choose to go to...\n")
    print("[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit game\n")
    print("Your choice? ", terminator: "")
    
    if let choice = readLine(){
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
        break
      }
    }
    
  }
}

func checkState(){
  print("Player name: \(player.name)\n")
  
  print("HP: \(player.hp)/ \(player.maxHp)")
  print("MP: \(player.mp)/ \(player.maxMp)\n")

  print("Magic:")
  print("- Physical Attack. No mana required. Deal 5pt of damage.")
  print("- Meteor. Use 50pt of mana. Deal 50pt of damage.")
  print("- Shield. Use 10pt of mana. Block enemy attack for 1 turn.")

  print("\nItems:")
  print("- Potion x\(player.potions). Heal 20pt of your HP")
  print("- Elixir x\(player.elixirs). Add 10pt of your MP\n")

  print("\nPress [return] to go back: ", terminator: "")
  returnToContinue()
}

func healWounds(){
  
}

func battle(stage: Int){
  
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

func isNameValid(_ input: String) -> Bool {
    if(input == ""){
      return false
    }
    let characterSet = CharacterSet.letters
    return input.rangeOfCharacter(from: characterSet.inverted) == nil
}