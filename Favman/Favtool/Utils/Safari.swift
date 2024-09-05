//
//  Safari.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 16/11/22.
//

import Foundation
import SwiftUI

var tecnologyPreview = 0;

func restartSafari (){
    if(tecnologyPreview == 1){
        let runningApplications = NSWorkspace.shared.runningApplications
            if let safari = runningApplications.first(where: { (application) in
                application
                    .bundleIdentifier == "com.apple.SafariTechnologyPreview" &&
                application
                    .bundleURL == URL(fileURLWithPath: NSWorkspace.shared.fullPath(forApplication: "Safari Technology Preview")!)}) {
                safari.terminate()
                kill(safari.processIdentifier, SIGTERM)
         }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/Safari Technology Preview.app"))
         }
    } else {
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
}


func donate() {
    let url = URL(string: "https://www.paypal.com/paypalme/favtool?country.x=IT&locale.x=it_IT")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}



func go(target : String) -> Void{
    let url = URL(string: "https://www.paypal.com/paypalme/favtool?country.x=IT&locale.x=it_IT")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}

func goTelegram() -> Void{
    let url = URL(string: "https://t.me/shyneon")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}

func goInstagram() -> Void{
    let url = URL(string: "https://www.instagram.com/shy_neon_dev?igsh=YXVyZjB3dXZybThw&utm_source=qr")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}

func goReddit() -> Void{
    let url = URL(string: "https://www.reddit.com/r/favtool/")!
    if NSWorkspace.shared.open(url) {
        print("default browser was successfully opened")
        
    }
}
