//
//  fancy_todolistApp.swift
//  fancy-todolist
//
//  Created by Dhanush  on 14/10/25.
//

import SwiftUI

@main
struct fancy_todolistApp: App {
    
    @State private var screenHeight: CGFloat?
    @State private var screenWidth: CGFloat?
    @State private var windowPositionX: CGFloat?
    @State private var windowPositionY: CGFloat?
    
    func moveAround() {
        windowPositionX = CGFloat.random(in: 0.0...screenWidth!)
        windowPositionY = CGFloat.random(in: 0.0...screenHeight!)
    }
    
    func dragSomethingIn() {
        //idw code allat but its gna look so cool so maybe one day i will
    }
    
    func saySomething() {
        //ill do this before drag something in
    }
    
    func decideWhatToDo() {
        //the cat likes to eat sushi btw
        var decision = Int.random(in: 1...3)
        if decision == 1 {
            moveAround()
        } else if decision == 2 {
            dragSomethingIn()
        } else if decision == 3 {
            saySomething()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                ContentView()
                    .containerBackground(.clear, for: .window)
                    .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification), perform: { _ in
                        NSApp.mainWindow?.standardWindowButton(.closeButton)?.isHidden = true
                        NSApp.mainWindow?.standardWindowButton(.zoomButton)?.isHidden = true
                        NSApp.mainWindow?.standardWindowButton(.miniaturizeButton)?.isHidden = true
                        NSApp.mainWindow?.styleMask = .borderless
                    })
                    .onAppear {
                        screenHeight = geometry.size.height
                        screenWidth = geometry.size.width
                    }
            }
        }
        .windowStyle(.hiddenTitleBar)
        .windowLevel(.floating)
        .windowBackgroundDragBehavior(.enabled)
        .windowResizability(.contentSize)
        #if os(macOS)
        Settings{
            SettingsView()
        }
        .windowResizability(.contentMinSize)
        #endif
    }
}
