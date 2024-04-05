import Foundation

class Elixir: Item{

  override init(name: String){
    super.init(name: name)
  }

  convenience init(){
    self.init(name: "Elixir")
  }

  override func use(on player: Player){
    player.elixirs -= 1
    let healAmount = Double(player.maxMp)*0.2
    player.mp += Int(healAmount)
    if player.mp >= player.maxMp{
      player.mp = player.maxMp
    }
  }
}