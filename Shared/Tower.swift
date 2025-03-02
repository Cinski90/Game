import SwiftUI

class Tower: Identifiable {
    let id = UUID()
    var position: CGPoint
    let range: CGFloat
    let damage: Int
    var movementPoints: Int = 2
    var movementCooldown: TimeInterval = 10.0
    
    init(position: CGPoint, range: CGFloat, damage: Int) {
        self.position = position
        self.range = range
        self.damage = damage
    }
    
    func attack(enemy: Enemy) {
        enemy.health -= damage
    }
    
    func distance(from pointA: CGPoint, to pointB: CGPoint) -> CGFloat {
        return sqrt(pow(pointB.x - pointA.x, 2) + pow(pointB.y - pointA.y, 2))
    }
}
