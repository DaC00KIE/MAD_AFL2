import Foundation

class Player{
  var name: String
  var hp: Int
  var maxHp: Int
  var mp: Int
  var maxMp: Int
  var potions: Int
  var elixirs: Int
  var level: Int
  var shield: Bool = false

  init(_ name: String){
    self.name = name
    maxHp = 100
    hp = maxHp
    maxMp = 100
    mp = maxMp
    potions = 10
    elixirs = 5
    level = 1
  }


}