import Foundation

class Potion: Item{

  override init(name: String){
    super.init(name: name)
  }

  convenience init(){
    self.init(name: "Potion")
  }

  override func use(on player: Player){
    player.potions -= 1
    player.hp += 20
    if player.hp >= player.maxHp{
      player.hp = player.maxHp
    }
  }
}