import SwiftUI

struct GameMapView: View {
    @ObservedObject var gameManager: GameManager
    @Binding var zoomLevel: CGFloat
    
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            ZStack {
                // Draw the map tiles
                MapView(gameManager: gameManager, zoomLevel: $zoomLevel)
                
                // Draw the towers
                ForEach(gameManager.towers) { tower in
                    TowerView(tower: tower, gameManager: gameManager)
                }
                
                // Draw the enemies
                ForEach(gameManager.enemies) { enemy in
                    EnemyView(enemy: enemy)
                }
            }
            .frame(
                width: CGFloat(gameManager.map.grid[0].count) * gameManager.map.tileSize,
                height: CGFloat(gameManager.map.grid.count) * gameManager.map.tileSize
            )
            .scaleEffect(zoomLevel)
            .background(Color.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

