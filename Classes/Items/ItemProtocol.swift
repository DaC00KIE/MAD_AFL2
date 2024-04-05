import Foundation

protocol ItemProtocol{
  var name: String{get}

  func use(on player: Player)
}