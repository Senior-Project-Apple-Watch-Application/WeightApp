
import SwiftUI

struct ScaleView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack{
            VStack {
                Text("Weight App")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding()
                Text("\(viewModel.lastRecordedWeight) \(viewModel.format)").foregroundColor(.green).font(.system(size: 70, weight: .bold))
                HStack(spacing: 0) {
                    Text("Updated: ")
                        .font(.system(size: 16, weight: .medium, design: .default))
                    Text(viewModel.weightData.last!.date, style: .date)
                        .font(.system(size: 16, weight: .medium, design: .default))
                    Text(" at ")
                        .font(.system(size: 16, weight: .medium, design: .default))
                    Text(viewModel.weightData.last!.date, style: .time)
                        .font(.system(size: 16, weight: .medium, design: .default))
                }
                Button {
                    print("pressed")
                } label: {
                    Text("Calculate Weight")
                        .frame(width: 240, height: 50)
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding()
                }
                
            }
        }
    }
}

struct ScaleView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleView()
    }
}
