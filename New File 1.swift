import SwiftUI

struct ZoomControls: View {
    @Binding var zoomLevel: CGFloat
    
    var body: some View {
        HStack {
            Button(action: {
                zoomLevel = max(zoomLevel - 0.1, 0.5) // Zoom out
            }) {
                Image(systemName: "minus.circle")
                    .font(.title)
                    .padding()
            }
            
            Button(action: {
                zoomLevel = min(zoomLevel + 0.1, 3.0) // Zoom in
            }) {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }
}

