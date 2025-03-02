import SwiftUI

struct TowerView: View {
    let tower: Tower
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        Circle()
            .fill(tower.id == gameManager.towerManager.selectedTower?.id ? Color.yellow : Color.red)
            .frame(width: 20, height: 20)
            .position(tower.position)
            .onTapGesture {
                gameManager.towerManager.selectTower(tower)
            }
    }
}

