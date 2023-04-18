//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    let formats = ["lbs", "kg"]

    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 15) {
                Text("Target Weight")

                ScrollViewReader { value in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(10..<800, id: \.self) {i in
                                Text("\(i)")
                                    .tag(i)
                                    .id(i)
                                    .foregroundColor(viewModel.targetWeight == i ? .green : .primary)
                                    .onTapGesture {
                                        viewModel.targetWeight = i
                                    }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .onAppear {
                            value.scrollTo(viewModel.targetWeight)
                        }
                        .onChange(of: viewModel.format) { newValue in
                            value.scrollTo(viewModel.targetWeight)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.vertical)

            Picker("Format", selection: $viewModel.format) {
                ForEach(formats, id: \.self) { format in
                    Text(format)
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(MainViewModel())
    }
}
