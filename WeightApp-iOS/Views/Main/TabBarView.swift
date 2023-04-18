//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            ScaleView()
                .tabItem {
                    Label("Scale", systemImage: "applewatch")
                }
                .tag(0)
            
            ChartsView()
                .tabItem {
                    Label("Charts", systemImage: "chart.xyaxis.line")
                }
                .tag(1)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "list.bullet.clipboard")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


