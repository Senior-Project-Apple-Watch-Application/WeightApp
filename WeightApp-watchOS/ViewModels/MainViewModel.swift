//

import SwiftUI
import Charts

class MainViewModel: ObservableObject {
    // weight data
    @Published var lastRecordedWeight = 125
    @Published var targetWeight = 120
    @Published var targetCalorieCount: Double = 1500
    @Published var calorieHistory: [CalorieDataModel] = []
    @Published var format = "lbs" {
        didSet {
            if format == "lbs" {
                lastRecordedWeight =  convertKgToLbs(lastRecordedWeight)
                targetWeight =  convertKgToLbs(targetWeight)
            } else if format == "kg" {
                lastRecordedWeight =  convertLbsToKg(lastRecordedWeight)
                targetWeight =  convertLbsToKg(targetWeight)
            }
        }
    }
    @Published var weightData = [
        WeightDataModel(date: Date(timeIntervalSince1970: 1679164236), lbs: 120),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679165236), lbs: 122),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679166236), lbs: 121),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679167236), lbs: 118),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679168236), lbs: 124),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679169236), lbs: 120),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679170236), lbs: 119),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679171236), lbs: 121),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679172236), lbs: 122),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679173236), lbs: 123),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679174236), lbs: 121),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679175236), lbs: 122),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679176236), lbs: 123),
        WeightDataModel(date: Date(timeIntervalSince1970: 1679177236), lbs: 125)
    ]
    
    var firstRecordedWeight: Int{
        weightData.first?.lbs ?? 0
    }
    
    var minWeight: Int {
        if format == "kg" {
            if let weight = weightData.min(by: { $0.kg < $1.kg })?.kg {
                return weight - 2 < 0 ? 0 : weight - 2
            }
        } else {
            if let weight = weightData.min(by: { $0.lbs < $1.lbs })?.lbs {
                return weight - 2 < 0 ? 0 : weight - 2
            }
        }

        return 0
    }
    var maxWeight: Int {
        if format == "kg" {
            if let weight = weightData.max(by: { $0.kg > $1.kg })?.kg {
                return weight + 8
            }
        } else {
            if let weight = weightData.max(by: { $0.lbs > $1.lbs })?.lbs {
                return weight + 8
            }
        }

        return 800
    }

    // chart settings
    @Published var lineWidth: CGFloat = 2
    @Published var interpolationMethod = InterpolationMethod.cardinal
    @Published var chartColor = Color.blue
    @Published var showSymbols = true

    // methods
    func refreshData() {
        // TODO: Refresh
    }

    // private
    public func convertLbsToKg(_ lbs: Int) -> Int {
        let kg = Float(lbs) / 2.205
        return Int(kg)
    }

    private func convertKgToLbs(_ kg: Int) -> Int {
        let lbs = Float(kg) * 2.205
        return Int(lbs)
    }
}
