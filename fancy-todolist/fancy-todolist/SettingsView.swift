//
//  SettingsView.swift
//  tryingtrying
//
//  Created by Dhanush  on 12/10/25.
//

import SwiftUI

struct GeneralSettingsView: View {
    
    @AppStorage("showOnAllDisplays") private var showOnAllDisplays: Bool = false
    @AppStorage("waitTimeMinimum") private var waitTimeMinimum: Int = 45
    @AppStorage("waitTimeMaximum") private var waitTimeMaximum: Int = 60
    
    var body: some View {
        List {
            Section {
                Toggle("Show on all displays, does nothing at the moment", isOn: $showOnAllDisplays)
            }
            
            Section(header: Text("Wandering time")) {
                VStack{
                    HStack {
                        Text("Minimum wandering time")
                        TextField("", value: $waitTimeMinimum, format: .number)
                    }
                    HStack {
                        Text("Maximum wandering time")
                        TextField("", value: $waitTimeMaximum, format: .number)
                    }
                }
            }
        }
    }
}

struct AdvancedSettingsView: View {
    var body: some View {
        List {
            Text("There is no advanced settings")
            Text("But if you want, you can give me 2 million dollars if you see me in public (please)")
        }
    }
}

struct SettingsView: View {
    var body: some View {
//        TabView{
//            Tab("General", systemImage: "gear"){
//                GeneralSettingsView()
//            }
//        }
//        .frame(maxWidth: 350, minHeight: 100)
        GeneralSettingsView()
    }
}

#Preview {
    SettingsView()
}
