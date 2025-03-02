import SwiftUI

class TowerManager {
    weak var gameManager: GameManager? // Reference to GameManager
    
    var selectedTower: Tower? = nil // Track the selected tower
    var availableTowers: [Tower] = [
        Tower(position: .zero, range: 100, damage: 10), // Example tower
        Tower(position: .zero, range: 120, damage: 15), // Another example tower
        // Add more towers as needed
    ]
    
    // Place a tower at the specified position
    func placeTower(at position: CGPoint, with tower: Tower) {
        guard let gameManager = gameManager else { return }
        
        let col = Int(position.x / gameManager.map.tileSize)
        let row = Int(position.y / gameManager.map.tileSize)
        
        if row >= 0 && row < gameManager.map.grid.count && col >= 0 && col < gameManager.map.grid[0].count {
            if gameManager.map.grid[row][col].type == .towerSpot && gameManager.resourceManager.deploymentPoints >= 50 {
                let newTower = Tower(
                    position: position,
                    range: tower.range,
                    damage: tower.damage
                )
                gameManager.towers.append(newTower)
                gameManager.resourceManager.deploymentPoints -= 50
                gameManager.map.grid[row][col].type = .empty
                print("Tower placed. Total towers: \(gameManager.towers.count), remaining deployment points: \(gameManager.resourceManager.deploymentPoints)")
            } else {
                print("Cannot place tower here. Tile type: \(gameManager.map.grid[row][col].type), deployment points: \(gameManager.resourceManager.deploymentPoints)")
            }
        }
    }
    
    // Update towers (e.g., cooldowns, movement points)
    func updateTowers(_ towers: [Tower], timePassed: TimeInterval) {
        for tower in towers {
            if tower.movementPoints < 2 {
                var remainingTime = timePassed
                while remainingTime > 0 && tower.movementPoints < 2 {
                    if tower.movementCooldown <= remainingTime {
                        remainingTime -= tower.movementCooldown
                        tower.movementPoints += 1
                        tower.movementCooldown = 10.0
                    } else {
                        tower.movementCooldown -= remainingTime
                        remainingTime = 0
                    }
                }
            }
        }
    }
    
    // Handle tower attacks on enemies
    func handleTowerAttacks(towers: [Tower], enemies: inout [Enemy]) {
        for tower in towers {
            for enemy in enemies {
                if tower.distance(from: tower.position, to: enemy.position) <= tower.range {
                    tower.attack(enemy: enemy)
                }
            }
        }
    }
    
    // Select a tower
    func selectTower(_ tower: Tower) {
        selectedTower = tower
    }
    
    // Move the selected tower to a new position
    func moveTower(_ tower: Tower, to position: CGPoint, in map: Map) -> Bool {
        let col = Int(position.x / map.tileSize)
        let row = Int(position.y / map.tileSize)
        
        print("Target tile: row \(row), col \(col), type \(map.grid[row][col].type)")
        print("Tower movement points: \(tower.movementPoints)")
        
        if row >= 0 && row < map.grid.count && col >= 0 && col < map.grid[0].count {
            let targetPosition = CGPoint(x: CGFloat(col) * map.tileSize + map.tileSize / 2, y: CGFloat(row) * map.tileSize + map.tileSize / 2)
            let distance = tower.distance(from: tower.position, to: targetPosition)
            
            print("Distance to target: \(distance)")
            
            if map.grid[row][col].type == .towerSpot && tower.movementPoints > 0 && distance <= 100 {
                tower.position = targetPosition
                tower.movementPoints -= 1
                print("Tower moved to \(targetPosition)")
                return true
            }
        }
        print("Move invalid")
        return false
    }
}
