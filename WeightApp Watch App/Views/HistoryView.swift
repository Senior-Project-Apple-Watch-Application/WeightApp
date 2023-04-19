
import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
            ScrollView {
                VStack {
                    Text("History")
                        .font(.largeTitle)
                    ForEach(viewModel.weightData.reversed()) { weight in
                
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.blue))
                            
                            HStack(spacing: 10) {
                                
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
                                
                            }
                            
                        }
                    }

                }
            }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(MainViewModel())
    }
}

