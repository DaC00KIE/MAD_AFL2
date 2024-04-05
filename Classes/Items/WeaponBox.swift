import Foundation

struct WeaponBox: Item{
  var element: Element
  var rarity: Rarity
  var level: Int

  static func generateBox(enemy: Enemy) -> WeaponBox{
    var startingRange = enemy.level-2
    if startingRange <= 1{
      startingRange = 1
    }
    let endRange = enemy.level + 2
    self.level = Int.random(startingRange...endRange)
    self.element = enemy.element
    self.rarity = Rarity.getRandomRarity()
  }

  func use() -> Weapon{

  }

}