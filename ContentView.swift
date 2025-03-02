import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager(map: Map(rows: 15, columns: 15))
    @State private var zoomLevel: CGFloat = 1.5
    
    var body: some View {
        VStack {
            // Top HUD
            GameHUD(gameManager: gameManager)
            
            // Scrollable Game Map
            GameMapView(gameManager: gameManager, zoomLevel: $zoomLevel)
            
            // Tower Bar
            TowerBar(gameManager: gameManager)
            
            // Zoom Controls
            ZoomControls(zoomLevel: $zoomLevel)
        }
        .onAppear {
            gameManager.startGame() // Start the game loop and first wave
        }
    }
}
