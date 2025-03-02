import SwiftUI
class ResourceManager {
    @Published var deploymentPoints: Int = 100
    var deploymentRate: Int = 1
    
    func updateResources(timePassed: TimeInterval) {
        if timePassed >= 1.0 {
            deploymentPoints += deploymentRate
        }
    }
}
