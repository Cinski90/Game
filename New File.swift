import SwiftUI

struct MapView: View {
    @ObservedObject var gameManager: GameManager
    @Binding var zoomLevel: CGFloat
    
    var body: some View {
        ForEach(0..<gameManager.map.grid.count, id: \.self) { row in
            ForEach(0..<gameManager.map.grid[row].count, id: \.self) { col in
                let tile = gameManager.map.grid[row][col]
                Rectangle()
                    .fill(tileColor(for: tile.type))
                    .frame(width: gameManager.map.tileSize, height: gameManager.map.tileSize)
                    .position(
                        x: CGFloat(col) * gameManager.map.tileSize + gameManager.map.tileSize / 2,
                        y: CGFloat(row) * gameManager.map.tileSize + gameManager.map.tileSize / 2
                    )
                    .onDrop(of: [.text], isTargeted: nil) { providers in
                        // Handle dropping the tower
                        if let provider = providers.first {
                            provider.loadObject(ofClass: NSString.self) { item, _ in
                                if let towerID = item as? String,
                                   let tower = gameManager.towerManager.availableTowers.first(where: { $0.id.uuidString == towerID }) {
                                    let position = CGPoint(
                                        x: CGFloat(col) * gameManager.map.tileSize + gameManager.map.tileSize / 2,
                                        y: CGFloat(row) * gameManager.map.tileSize + gameManager.map.tileSize / 2
                                    )
                                    DispatchQueue.main.async {
                                        gameManager.towerManager.placeTower(at: position, with: tower)
                                    }
                                }
                            }
                        }
                        return true
                    }
            }
        }
    }
    
    func tileColor(for type: TileType) -> Color {
        switch type {
        case .path: return .gray
        case .towerSpot: return .green
        case .empty: return .brown
        }
    }
}
