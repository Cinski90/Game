import SwiftUI

class Unit {
    var position: CGPoint
    var health: Int
    let speed: CGFloat
    
    init(position: CGPoint, health: Int, speed: CGFloat) {
        self.position = position
        self.health = health
        self.speed = speed
    }
    
    func takeDamage(amount: Int) {
        health -= amount
        if health <= 0 {
            print("Unit defeated at position: \(position)")
        }
    }
}
