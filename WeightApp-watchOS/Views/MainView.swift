//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    updates()

                    ChartView(isOverview: true)
                        .environmentObject(viewModel)

                    // advanced graph
                    navLink(
                        title: "Advanced Graph",
                        systemImage: "chart.xyaxis.line",
                        color: .blue,
                        view: ChartView()
                            .environmentObject(viewModel)
                            .navigationTitle("Weight Chart")
                    )
                    
                    // refresh
                    refreshButton()
                    
                    // stats view
                    navLink(title: "Statistics",
                            systemImage: "percent",
                            color: .red,
                            view: StatisticsView().environmentObject(viewModel)
                    )
                    
                    // calorie view
                    navLink(title: "Calorie Check",
                            systemImage: "checkmark.circle",
                            color: .orange,
                            view: CalorieView().environmentObject(viewModel)
                    )
                    // history view
                    navLink(title: "Weight History",
                            systemImage: "arrow.backward",
                            color: .purple,
                            view: HistoryView().environmentObject(viewModel)
                    )

                    // settings view
                    navLink(
                        title: "Settings",
                        systemImage: "gearshape.fill",
                        color: .gray,
                        view: SettingsView().environmentObject(viewModel)
                    )
                }
                .padding()
            }
            .navigationTitle("Weights")
        }
    }
}

// MARK: - views
extension MainView {
    private func updates() -> some View {
        Group {
            Text("Last weight: \(viewModel.lastRecordedWeight) \(viewModel.format)")
            Text("Target weight: \(viewModel.targetWeight) \(viewModel.format)")
        }
        .font(.caption2)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func refreshButton() -> some View {
        Button(action: {
            viewModel.refreshData()
        }) {
            Label("Refresh Data", systemImage: "arrow.clockwise")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
        .padding()
        .background(Color.green)
        .cornerRadius(10)
    }

    private func navLink<V: View>(title: String, systemImage: String, color: Color, view: V) -> some View {
        NavigationLink {
            view
        } label: {
            Label(title, systemImage: systemImage)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(color)
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
