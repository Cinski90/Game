import SwiftUI

class EnemyManager {
    func spawnEnemies(for wave: Int, in enemies: inout [Enemy]) {
        for _ in 0..<wave * 5 {
            let enemy = Enemy(
                position: CGPoint(x: 50, y: 50), // Example starting position
                health: 100 + (wave * 20),
                speed: 1,
                value: 10 + (wave * 5)
            )
            enemies.append(enemy)
            print("Enemy spawned. Total enemies: \(enemies.count)")
        }
    }
    
    func updateEnemies(_ enemies: inout [Enemy]) {
        // Remove dead enemies
        enemies.removeAll { $0.health <= 0 }
    }
}
