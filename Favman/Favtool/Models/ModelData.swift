//
//  File.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 17/11/22.
//

import Foundation
import SwiftUI


class Sites : ObservableObject {

    @Published var list : [Site] = [];
    
    
    init () {
        
        do {
            
            var index = numberOfSites() - 1;
            var ret = Array(repeating: nullSite, count: numberOfSites());
           
            for row in try prepareTable() {
                ret[index].host = try! row.get(host);
                do{
                   ret[index].transparencyResult = try row.get(transparency);
                    
                } catch {
                    print("func get transparency: \(error)");
                    ret[index].transparencyResult = 0
                }
                ret[index].id = index;
                print(ret[index])
                index -= 1;
                for j in 0..<ret.count{
                    ret[j].iconPath = imageFolder!.appendingPathComponent(ret[j].md5 + ".png");
                }
            }
            self.list = ret.sorted { $0.domainName < $1.domainName };
        } catch {
            let ret = Array(repeating: nullSite, count: numberOfSites());
            self.list = ret;
        }
        
    }
    
    func SiteWere(id : Int) -> Site{
        for j in 0..<list.count {
            if(id == list[j].id){
                return list[j]
            }
        }
        return nullSite
    }

}


