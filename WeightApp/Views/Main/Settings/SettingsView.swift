//
//  BluetoothPeripherals.swift
//  WeightApp
//
//  Created by DJC on 4/18/23.
//

import SwiftUI

struct SettingsView: View {
    // Bluetooth
    @State private var showDevices = false
    // Firebase
    @StateObject var sessionService = SessionServiceImpl()
    let projectURL = URL(string: "https://www.cis.fiu.edu")!
    
    var body: some View {
        NavigationView {
            Form {
                profileSection
                devSection
                logoutSection
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SessionServiceImpl())
    }
}

extension SettingsView {
    
    // User Profile
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
                Button("Edit User Information") {
                    
                }
                    .padding(.leading, 3)
            }
            
            HStack() {
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius:5))
                Button("Connect to a Scale") {
                    showDevices.toggle()
                }
                .padding(.leading, 3)
                .sheet(isPresented: $showDevices) {
                    BluetoothPeripherals()
                }
            }
        }
    }
    
    // Developers
    private var devSection: some View {
        Section(
            header: Text("Developers"),
            footer: Text("Continuation of development of an app showcasing weight. Credit to Product Owner Jessica Ramella and Computer Science studens at FIU.")) {
                HStack(alignment:.top) {
                    Image("kfscis")
                        .resizable()
                        .scaledToFit()
                    
                }
                .padding(.vertical)
                HStack {
                    Link("Project Website", destination: projectURL)
                }
            }
    }
    
    // Logout Button
    private var logoutSection: some View {
        Section() {
            HStack{
                Spacer()
                Button("Logout") {
                    sessionService.logout()
                }
                Spacer()
            }
        }
    }
}
