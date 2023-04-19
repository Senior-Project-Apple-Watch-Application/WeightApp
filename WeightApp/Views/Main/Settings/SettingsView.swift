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
    @EnvironmentObject var sessionService: SessionServiceImpl
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
                Link("Edit User Information", destination: projectURL)
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
            footer: Text("This application is in conjuntion with Knight Foundation School of Computing and Information Sciences Undergraduate students as part of a Spring 2023 Semester Senior Design Project.")) {
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
