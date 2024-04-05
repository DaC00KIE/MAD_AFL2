import Foundation

class WeaponBox: Item{
  override init(name: String){
    super.init(name: name)
  }

  convenience init(){
    self.init(name: "Weapon Box")
  }

  override func use(on player:Player){
    player.weaponBox -= 1
    let weapon = Weapon.generateRandom(level: player.level)

    print("You've received a ", terminator: "")
    weapon.printName()
    print("")
    
    print("Would you like to equip it? [Y/ N]", terminator: " ")
    while true {
        guard let input = readLine()?.uppercased() else {
            continue // Continue looping if there's no input
        }

        switch input {
        case "Y":
          player.equip(weapon)
          print("You are now equipping a ", terminator: "")
          weapon.printName()
          return
        case "N":
          return
        default:
            break // Ignore other inputs and continue looping
        }
    }
    
    
  }

}