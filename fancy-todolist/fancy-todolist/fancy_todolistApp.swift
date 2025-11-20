//
//  fancy_todolistApp.swift
//  fancy-todolist
//
//  Created by Dhanush  on 14/10/25.
//

import SwiftUI
import Foundation
internal import Combine

@main
struct fancy_todolistApp: App {
    
    @State private var screenHeight: CGFloat?
    @State private var screenWidth: CGFloat?
    @State private var windowPositionX: CGFloat?
    @State private var windowPositionY: CGFloat?

    @State private var duration: Double = 3.0
    let timer = Timer.publish(every: 0.5, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    //func moveAround but it doesnt move too close to previous position (its unfinished btw cuz i was lz HAHA)
//    @State private var newWindowPositionX: CGFloat?
//    @State private var newWindowPositionY: CGFloat?
//    
//    func otherMoveAround() {
//        newWindowPositionX = CGFloat.random(in: 0.0...screenWidth!)
//        newWindowPositionY = CGFloat.random(in: 0.0...screenHeight!)
//        if (newWindowPositionX! - windowPositionX! == 100 && newWindowPositionY! - windowPositionY! == 100) {
//            windowPositionX = CGFloat.random(in: 0.0...screenWidth!)
//        }
//    }
    
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
        WindowGroup(id: "main") {
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
                    .onReceive(timer) { time in
                        moveAround()
                        if (windowPositionX != nil) && (windowPositionY != nil) {
                            withAnimation {
                                NSApp.mainWindow?.setFrameOrigin(NSPoint(x: windowPositionX!, y: windowPositionY!))
                            }
                        }
                    }
            }
        }
        .windowStyle(.hiddenTitleBar)
        .windowLevel(.floating)
        .windowBackgroundDragBehavior(.enabled)
        .windowResizability(.contentMinSize)
#if os(macOS)
        Settings{
            SettingsView()
        }
#endif
    }
}
