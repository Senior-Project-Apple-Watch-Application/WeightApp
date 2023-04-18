
import SwiftUI
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? peripheral.description)
        }
    }
}

struct SheetView: View {
    
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Text(peripheral)
            }
            Spacer()
            Text("Select a peripheral device")
                .font(.headline)
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
        }
    }
}

struct SettingsView: View {
    
    @State private var showingSheet = false
    
    let projectURL = URL(string: "https://www.cis.fiu.edu")!
    
    var body: some View {
        NavigationView {
            Form {
                profileSection
                devSection
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var profileSection: some View {
        Section (header:Text("Profile")) {
            
            HStack() {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("Benito Ocasio")
                    .font(.system(size: 32))
                    .padding(.leading, 3)
            }
            .padding(.vertical)
            
            HStack() {
                Image("firebase")
                    .resizable()
                    .frame(width: 30, height: 30)
                Link("Edit User Information", destination: projectURL)
                    .padding(.leading, 3)
            }
            
            HStack() {
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius:5))
                Button("Connect to a Scale") {
                    showingSheet.toggle()
                }
                .padding(.leading, 3)
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
            }
        }
    }
    
    private var devSection: some View {
        Section(
            header: Text("Developers"),
            footer: Text("This application is in conjuntion with Knight Foundation School of Computing and Information Sciences Undergraduate students as part of a Spring 2023 Semester Senior Design Project.")) {
                HStack(alignment:.top) {
                    Image("kfscis")
                        .resizable()
                        .scaledToFit()
                }
                .padding(.vertical)
                Link("Project Website", destination: projectURL)
            }
        
    }
}
