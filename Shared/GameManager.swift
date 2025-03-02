import SwiftUI
import Combine

class GameManager: ObservableObject {
    @Published var map: Map
    @Published var towers: [Tower] = []
    @Published var enemies: [Enemy] = []
    
    let resourceManager = ResourceManager()
    let waveManager = WaveManager()
    let towerManager = TowerManager()
    
    private let enemyManager = EnemyManager()
    let movementSystem = MovementSystem()
    private let gameLoopManager = GameLoopManager()
    
    init(map: Map) {
        self.map = map
        print("GameManager initialized with map size: \(map.grid.count)x\(map.grid[0].count)")
        
        // Set up dependencies
        waveManager.enemyManager = enemyManager
        gameLoopManager.gameManager = self
        towerManager.gameManager = self // Pass GameManager reference to TowerManager
    }
    
    func startGame() {
        waveManager.startWave(enemies: &enemies)
        gameLoopManager.runGameLoop()
    }
    
    func updateGame(timePassed: TimeInterval) {
        resourceManager.updateResources(timePassed: timePassed)
        movementSystem.moveEnemies(&enemies, in: map)
        towerManager.updateTowers(towers, timePassed: timePassed)
        towerManager.handleTowerAttacks(towers: towers, enemies: &enemies)
        
        if enemies.isEmpty {
            waveManager.startWave(enemies: &enemies)
        }
    }
}
