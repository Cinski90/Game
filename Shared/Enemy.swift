import SwiftUI

class Enemy: Identifiable {
    let id = UUID()
    var position: CGPoint
    var health: Int
    let speed: CGFloat
    let value: Int
    
    init(position: CGPoint, health: Int, speed: CGFloat, value: Int) {
        self.position = position
        self.health = health
        self.speed = speed
        self.value = value
    }
}
