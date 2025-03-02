import SwiftUI

struct Tile: Identifiable {
    let id = UUID()
    var type: TileType
}

enum TileType {
    case path, towerSpot, empty
}

class Map: ObservableObject {
    @Published var grid: [[Tile]]
    let tileSize: CGFloat = 40
    
    init(rows: Int, columns: Int) {
        self.grid = Array(repeating: Array(repeating: Tile(type: .empty), count: columns), count: rows)
        
        for i in 0..<rows {
            grid[i][0].type = .path
        }
        for j in 1..<columns {
            grid[rows-1][j].type = .path
        }
        
        for i in 0..<rows {
            for j in 0..<columns {
                if grid[i][j].type == .empty && Bool.random() {
                    grid[i][j].type = .towerSpot
                }
            }
        }
        
        print("Map initialized with \(rows) rows and \(columns) columns")
    }
}
