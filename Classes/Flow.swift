import Foundation

class Flow{
  
  func openingScreen(){
    var keepLooping = true

    print("Welcome to the world of magic! 🧙🔮\n")
    print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🗻, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")

    print("\nPress [return] to continue: ", terminator: "")
    
    while(keepLooping){
      if(readLine() == ""){
        keepLooping = false
      }
    }
    
  }

  func registerName() -> String{
    let keepLooping = true

    print("Enter a string:")

    while(keepLooping){
      if let name = readLine(){
        if isNameValid(name){
          return name
        }
      }
    }
  }

  func isNameValid(_ input: String) -> Bool {
      if(input == ""){
        print("")
        return false
      }
      let characterSet = CharacterSet.letters.union(CharacterSet(charactersIn: " "))
      return input.rangeOfCharacter(from: characterSet.inverted) == nil
  }
  
}