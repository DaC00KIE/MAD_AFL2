import Foundation

class Magic{
  var name: String
  var description: String
  var manaCost: Int
  var type: Element

  init(_ name: String, _ description: String, _ manaCost: Int, _ type: Element){
    self.name = name
    self.description = description
    self.manaCost = manaCost
    self.type = type
  }

  func details(){
    print("\(name). ", terminator: "")
    if manaCost == 0{
      print("No mana required. ",terminator: "")
    }else{
      print("Use \(manaCost)pt of mana. ", terminator: "")
    }
    print("\(description). ")
  }
}