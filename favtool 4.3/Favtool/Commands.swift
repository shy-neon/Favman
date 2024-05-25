//
//  Commands.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 22/11/22.
//

import Foundation
import SwiftUI


struct EmptyCommands: Commands {
    
    
    var body: some Commands {
        
        CommandGroup(replacing: .saveItem) {
            Button {try! ImageFolderIsLocked(true)} label: {Text("Lock Image Folder")}
                .keyboardShortcut("l")
            Button {try! ImageFolderIsLocked(false)} label: {Text("Unlock Image Folder")}
                .keyboardShortcut("u")
        }
        
        CommandGroup(replacing: .appInfo) {
            NavigationLink {AppInfoView()} label: {Text("About Favtool")}
        }
        
        CommandGroup(replacing: .pasteboard) {
            Button {restartSafari()} label: {Text("Restart Safari")}
                .keyboardShortcut("r")
            
            Button {
                showSavePanel(path: safari!)
                removeItems(path: readingListFolder!)
                //createFolder(path: readingListFolder!)
            } label: {
                Text("Enable Bookmarks Support")
            }.keyboardShortcut(KeyEquivalent("b"), modifiers: [.command, .option])
            
            Button {
                try! ImageFolderIsLocked(false)
                removeItems(path: touchIconFolder!)
                restartSafari()
            } label: {
                Text("Reset Default Icons")
            }.keyboardShortcut(KeyEquivalent("D"), modifiers: [.command, .option])
            
        }
        
        CommandGroup(replacing: .windowSize) {
            EmptyView()
        }
        CommandGroup(replacing: .windowArrangement) {
            EmptyView()
        }
        CommandGroup(replacing: .windowList) {
            EmptyView()
        }
        CommandGroup(replacing: .systemServices) {
            EmptyView()
        }
        CommandGroup(replacing: .toolbar) {
            EmptyView()
        }
    }
}
