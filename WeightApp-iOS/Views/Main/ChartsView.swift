//

import SwiftUI

struct ChartsView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Spacer()
                    
                    weightsSection
                    
                    Spacer()
                    
                    ChartView(isOverview: true)
                        .environmentObject(viewModel)
                        .padding(15)
                    
                    Spacer()
                    
                    ChartView(isOverview: false)
                        .environmentObject(viewModel)
                        .padding(15)
                    
                }
            } .navigationTitle("Charts")
        }
        
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

extension ChartsView {
    
    private var weightsSection: some View {
        
        HStack(spacing: 100) {
            VStack {
                Text("\(viewModel.lastRecordedWeight) \(viewModel.format)")
                Text("Last weight").font(.footnote)
            }
            
            VStack {
                Text("\(viewModel.targetWeight) \(viewModel.format)")
                Text("Target weight").font(.footnote)
            }
            
        }
        
    }
    
}
