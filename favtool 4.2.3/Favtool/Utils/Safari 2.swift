//
//  Safari.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 16/11/22.
//

import Foundation
import SwiftUI


func restartSafari (){
    let runningApplications = NSWorkspace.shared.runningApplications
        if let safari = runningApplications.first(where: { (application) in
            application
                .bundleIdentifier == "com.apple.Safari" &&
            application
                .bundleURL == URL(fileURLWithPath: NSWorkspace.shared.fullPath(forApplication: "Safari")!)}) {
            safari.terminate()
            kill(safari.processIdentifier, SIGTERM)
     }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/Safari.app"))
     }
}

func donate() {
    let url = URL(string: "https://www.paypal.com/paypalme/favtool?country.x=IT&locale.x=it_IT")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}
