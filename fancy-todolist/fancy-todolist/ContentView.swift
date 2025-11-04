//
//  ContentView.swift
//  fancy-todolist
//
//  Created by Dhanush  on 14/10/25.
//

import SwiftUI

struct ContentView: View {
        

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
        }
    }
}

#Preview {
    ContentView()
}
