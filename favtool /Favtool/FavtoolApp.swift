//
//  FavtoolApp.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 15/11/22.
//

import SwiftUI

extension Scene {
    func contentSizedWindowResizability() -> some Scene {
        if #available(macOS 13.0, *) {
            return self.windowResizability(.contentSize)
        } else {
            return self
        }
    }
}

@main

struct MenuTestApp: App {
    var body: some Scene {
        WindowGroup ("Favtool"){
            ContentView()
                .frame(minWidth: 600, maxWidth: 600, minHeight: 410, maxHeight: 410)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
                    for window in NSApplication.shared.windows {
                        window.standardWindowButton(.zoomButton)?.isEnabled = false
                    }})
                .onAppear {NSWindow.allowsAutomaticWindowTabbing = false; }
                .onDisappear{terminateApp()}
                
        }
        
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false))
        .commands{EmptyCommands()}
        .contentSizedWindowResizability()
    }
       
    
    private func terminateApp() {
            NSApplication.shared.terminate(self)
    }

}






