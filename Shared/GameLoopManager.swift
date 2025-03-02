import SwiftUI
class GameLoopManager {
    weak var gameManager: GameManager?
    private var lastUpdateTime: Date = Date()
    
    func runGameLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            let currentTime = Date()
            let timePassed = currentTime.timeIntervalSince(self.lastUpdateTime)
            self.lastUpdateTime = currentTime
            self.gameManager?.updateGame(timePassed: timePassed)
        }
        print("Game loop started")
    }
}
