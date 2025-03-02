class WaveManager {
    var wave: Int = 0
    weak var enemyManager: EnemyManager?
    
    func startWave(enemies: inout [Enemy]) {
        wave += 1
        print("Wave \(wave) started")
        enemyManager?.spawnEnemies(for: wave, in: &enemies)
    }
}
