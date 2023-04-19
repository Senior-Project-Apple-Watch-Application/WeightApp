

import SwiftUI

struct CalorieView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var calorieIntake: Double =  0
    @State private var date = Date()
    @State private var lastCalorieIntake: Double? = nil
    @State private var showCalorieInput = true
    
    let increments = Array(stride(from: 100, to: 3100, by: 100))
    
    var difference: Int? {
        if calorieIntake == 0{
            return nil
        }
        return Int(round(viewModel.targetCalorieCount)) - Int(round(calorieIntake))
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 15) {
                Text("Calorie Target")
                
                ScrollViewReader { value in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(increments, id: \.self) {i in
                                Text("\(i)")
                                    .tag(i)
                                    .id(i)
                                    .foregroundColor(Int(viewModel.targetCalorieCount) == i ? .green : .primary)
                                    .onTapGesture {
                                        viewModel.targetCalorieCount = Double(i)
                                    }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .onAppear {
                            value.scrollTo(viewModel.targetCalorieCount)
                        }
                        .onChange(of: viewModel.format) { newValue in
                            value.scrollTo(viewModel.targetCalorieCount)
                        }
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }

            if calorieIntake == 0{
                VStack(alignment: .leading, spacing: 0){
                    
                    Text("Enter Your Calorie Intake")
                    TextField("Something", value: $calorieIntake, formatter: NumberFormatter(), onCommit: {
                        let string = String(format: "%.0f", calorieIntake)
                        let filtered = string.filter { "0123456789".contains($0) }
                        if let value = Double(filtered) {
                            self.calorieIntake = value
                        }
                    })
                    Button(action: {
                        self.lastCalorieIntake = calorieIntake
                        self.viewModel.calorieHistory.append(CalorieDataModel(date: date, calorieIntake: calorieIntake))
                        calorieIntake = 0
                        showCalorieInput = false
                    }, label: {
                        Text("")
                    })
                }
            }
 
            if let difference = difference{
                VStack(alignment: .leading, spacing: 0){
                    Text("Calorie Difference: \(difference)")
                        .lineSpacing(10)
                    Text(difference >= 0 ? "You've met/exceeded your target!" : "You haven't met your target.")
                        .foregroundColor(difference >= 0 ? .green : .red)
                }

            }
            if !showCalorieInput{
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0){
                        Text("\(dateFormatter.string(from: date))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                            .font(.headline)
                        Text("\(Int(calorieIntake)) Calories")
                            .frame(alignment: .trailing)
                            .font(.headline)
                    }
                }
                
            }

            }
            
        }
    }
    
    struct CalorieView_Previews: PreviewProvider {
        static var previews: some View {
            CalorieView()
                .environmentObject(MainViewModel())
        }
    }
