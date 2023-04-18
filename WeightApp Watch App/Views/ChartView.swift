//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var isOverview: Bool = false

    // TODO: Chart view advanced options

    var body: some View {
        Chart {
            ForEach(viewModel.weightData) { weight in
                LineMark(
                    x: .value("Date", weight.date),
                    y: .value(
                        "\(viewModel.format)",
                        viewModel.format == "kg" ? weight.kg : weight.lbs
                    )
                )
                .lineStyle(StrokeStyle(lineWidth: viewModel.lineWidth))
                .foregroundStyle(viewModel.chartColor.gradient)
                .symbol(Circle().strokeBorder(lineWidth: viewModel.lineWidth / 2))
                .symbolSize(viewModel.showSymbols && !isOverview ? 60 : 0)
                .interpolationMethod(viewModel.interpolationMethod)
            }

            RuleMark(y: .value("Test", viewModel.targetWeight))
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [8]))
                .foregroundStyle(.red)
                .annotation(position: .bottom, alignment: .trailing) {
                    Text("\(viewModel.targetWeight) \(viewModel.format)")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
        }
        .chartYScale(domain: viewModel.minWeight...viewModel.maxWeight)
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartYAxisLabel("Weight (\(viewModel.format))")
        .chartXAxisLabel("Time")
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(MainViewModel())
    }
}
