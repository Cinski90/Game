import SwiftUI

struct TowerBar: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(gameManager.towerManager.availableTowers, id: \.id) { tower in
                TowerIcon(tower: tower, gameManager: gameManager)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

struct TowerIcon: View {
    let tower: Tower
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        Circle()
            .fill(Color.red) // Example color for the tower icon
            .frame(width: 40, height: 40)
            .overlay(Text("T")) // Example text for the tower icon
            .onDrag {
                // Start dragging the tower
                NSItemProvider(object: tower.id.uuidString as NSString)
            }
    }
}
