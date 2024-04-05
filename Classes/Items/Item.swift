import Foundation

class Item: ItemProtocol{
  var name: String

  init(name: String){
    self.name = name
  }

  func use(){
    print("This item cannot be used")
  }
}