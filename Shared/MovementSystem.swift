import SwiftUI

class MovementSystem {
    func moveEnemies(_ enemies: inout [Enemy], in map: Map) {
        for enemy in enemies {
            let col = Int(enemy.position.x / map.tileSize)
            let row = Int(enemy.position.y / map.tileSize)
            
            if col < map.grid[0].count - 1 {
                enemy.position.x += enemy.speed
            } else if row < map.grid.count - 1 {
                enemy.position.y += enemy.speed
            }
        }
    }
    
    func moveTower(_ tower: Tower, to position: CGPoint, in map: Map) -> Bool {
        let col = Int(position.x / map.tileSize)
        let row = Int(position.y / map.tileSize)
        
        if row >= 0 && row < map.grid.count && col >= 0 && col < map.grid[0].count {
            let targetPosition = CGPoint(x: CGFloat(col) * map.tileSize + map.tileSize / 2, y: CGFloat(row) * map.tileSize + map.tileSize / 2)
            let distance = tower.distance(from: tower.position, to: targetPosition)
            
            if map.grid[row][col].type == .towerSpot && tower.movementPoints > 0 && distance <= 100 {
                tower.position = targetPosition
                tower.movementPoints -= 1
                return true
            }
        }
        return false
    }
}
