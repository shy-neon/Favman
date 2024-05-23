//
//  Site.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 15/11/22.
//

import Foundation
import CryptoKit
import SwiftUI
import PublicSuffix

var nullSite = Site(id: -1, host: "www.shy-neon.com", transparencyResult : 0, iconChanges: false)

struct Site : Identifiable, Hashable {
    
    var id : Int;
    
    
    var host : String;
    var md5 : String {
        Insecure.MD5
        .hash(data: host.data(using: .utf8)!)
        .map{String(format: "%02hhx", $0)}
        .joined()
        .uppercased();
    }
    
    var transparencyResult : Int;
    
    var domainName : String {
    
//    code for domain pharser slow
        
//        var ret = praseHost(self.host) //string
//        let capitalFirst = ret.prefix(1).capitalized.capitalized //S
//        ret = ret.dropFirst().lowercased() //tring
//        return capitalFirst + ret //String
        
        var components = SuffixList.default.parse(self.host)
        if(components != nil){
            return components!.sld
        } else {
            return host
        }
    }
    
    var iconChanges : Bool
    
    var iconPath : URL {
        imageFolder!.appendingPathComponent(self.md5 + ".png");
    }
    
    var icon : some View {
        AsyncImage(url: iconPath) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image("null")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }

    mutating func setTransparency(value: Int) {
            transparencyResult = value
    }
    
}

