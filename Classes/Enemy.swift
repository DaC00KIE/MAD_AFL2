import Foundation

class Enemy: Character{

  var vitalsScanned: Bool = false
  var element: Element = .none

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
  }

  func displayBattleState(){
    print("\(name) Lv. ", terminator: "")
    if(vitalsScanned){
      print("\(level)")
      print("HP: \(currentHealth())")
    }else{
      print("???")
      print("HP: ???/ ???")
    }
    
  }

  convenience init(){
    self.init("Unnamed Enemy", 100, 10, 1)
  }

  func scanVitals(){
    vitalsScanned = true
    print("Enemy scanned")
  }
}