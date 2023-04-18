//

import Foundation

struct WeightDataModel: Identifiable {
    let id = UUID()
    let date: Date
    var formattedDate: String {
        date.formatted(date: .omitted, time: .shortened)
    }
    let lbs: Int
    var kg: Int {
        Int(Float(lbs) / 2.205)
    }
}
