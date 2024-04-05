import Foundation

class Enemy: Character{

  var vitalsScanned: Bool = false

  override init(_ name: String, _ hp: Int, _ attack: Int, _ level: Int){
    super.init(name, hp, attack, level)
    self.element = Element.getRandomElement()
  }

  func displayBattleState(){
    if(vitalsScanned){
      print("\(name) [\(element.emoji)] Lv. \(level)")
      print("HP: \(currentHealth())")
    }else{
      print("\(name) [?] Lv. ???")
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