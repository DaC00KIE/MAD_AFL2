import Foundation

class Player{
  var name: String
  var hp: Int
  var mp: Int
  var potions: Int
  var elixirs: Int
  var level: Int
  var shield: Bool = false

  init(_ name: String){
    self.name = name
    hp = 100
    mp = 100
    potions = 10
    elixirs = 5
    level = 1
  }


}