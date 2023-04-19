//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    let formats = ["% from target", "% from start to end"]
    var body: some View {
        let difference = Double(viewModel.lastRecordedWeight - viewModel.targetWeight)
        let differenceFromStartToEnd = Double(viewModel.lastRecordedWeight - viewModel.firstRecordedWeight)
        let percentage = abs(difference) / Double(viewModel.targetWeight) * 100
        let percentageFromStartToFinish = abs(differenceFromStartToEnd) / Double(viewModel.firstRecordedWeight) * 100
        List{
            VStack {
                switch viewModel.format{
                case "% from target":
                    Text("Percentage")
                        .frame(maxWidth: .infinity)
                    ScrollViewReader { value in
                        ScrollView(.vertical) {
                            Text("\(String(format: "%.1f", percentage))%")
                                .font(.largeTitle)
                                .foregroundColor(difference >= 0 ? .red : .green)
                            
                            Text(difference <= 0 ? "You reached your target weight!" : "You still need to lose \(viewModel.format == "kg" ? "\(viewModel.convertLbsToKg(Int(abs(difference)))) kg" : "\(Int(abs(difference))) lbs")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.top)
                            
                            Spacer()}
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                case "% from start to end":
                    Text("Percentage")
                        .frame(maxWidth: .infinity)
                    ScrollViewReader { value in
                        ScrollView(.vertical) {
                            Text("\(String(format: "%.1f", percentageFromStartToFinish))%")
                                .font(.largeTitle)
                                .foregroundColor(differenceFromStartToEnd >= 0 ? .red : .green)
                            
                            Text(differenceFromStartToEnd <= 0 ? "You've lost \(viewModel.format == "kg!" ? "\(viewModel.convertLbsToKg(Int(abs(differenceFromStartToEnd)))) kg!" : "\(Int(abs(differenceFromStartToEnd))) lbs!")" : "You've gained \(viewModel.format == "kg." ? "\(viewModel.convertLbsToKg(Int(abs(differenceFromStartToEnd)))) kg." : "\(Int(abs(differenceFromStartToEnd))) lbs.")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.top)
                            
                            Spacer()}
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                default:
                    Text("Choose your statistic")
            }
        }
            .padding(.horizontal)
            Picker("Format", selection: $viewModel.format) {
                ForEach(formats, id: \.self) { format in
                    Text(format)
                }
            }
            .pickerStyle(.inline)
            .padding()
            .navigationTitle("Stats")
        }
        
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(MainViewModel())
    }
}
