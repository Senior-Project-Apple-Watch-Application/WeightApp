//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    ForEach(viewModel.weightData.reversed()) { weight in
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                            
                            HStack(spacing: 100) {
                                
                                VStack {
                                    
                                    Text(weight.date, style: .time)
                                        .font(.footnote)
                                    Text(weight.date, style: .date)
                                        .font(.footnote)
                                }
                                
                                HStack(spacing: 0){
                                    Text("\(weight.lbs) ")
                                        .font(.title)
                                    Text("\(viewModel.format)")
                                }
                                
                            }.padding(15)
                            
                        }.padding(15)
                    }

                }
            } .navigationTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
