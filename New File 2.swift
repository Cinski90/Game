import SwiftUI

struct EnemyView: View {
    let enemy: Enemy
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 15, height: 15)
            .position(enemy.position)
    }
}

