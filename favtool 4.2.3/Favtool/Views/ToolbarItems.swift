//
//  ToolbarItems.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 19/11/22.
//

import SwiftUI

struct ItemsToolbar: ToolbarContent {
    
    @EnvironmentObject var sites : Sites;
    @Binding var selection: Site?;
    
    var body: some ToolbarContent {
        
       
        
        ToolbarItem(placement: .navigation) {
            Button(action: toggleSidebar, label: {
            Image(systemName: "sidebar.leading")})
        }
        
        
        
        
    }
}



func toggleSidebar() { // 2
       NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
