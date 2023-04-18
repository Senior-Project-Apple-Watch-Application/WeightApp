

import SwiftUI

struct CalorieDataModel: Codable, Identifiable {
    var id = UUID()
    let date: Date
    let calorieIntake: Double
}
