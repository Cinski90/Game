import SwiftUI

struct GameHUD: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        HStack {
            Text("Deployment Points: \(gameManager.resourceManager.deploymentPoints)")
                .font(.headline)
                .foregroundColor(.yellow)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
            
            Spacer()
            
            Text("Wave: \(gameManager.waveManager.wave)")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}
