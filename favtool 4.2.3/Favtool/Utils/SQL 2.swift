//
//  File.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 17/11/22.
//

import Foundation
import SQLite
import SwiftUI

var cacheSettings = Table("cache_settings");

let id = Expression<Int64>("id");
let host = Expression<String>("host");
let hosti = Expression<Int>("host");
let transparency = Expression<Int>("transparency_analysis_result");
let icon = Expression<String>("icon_is_in_cache");

func tryConnection () throws ->  Connection {
    var dataBase : Connection!;
    do{
        dataBase = try Connection(touchIconCacheSettings!.absoluteString);
        print("func tryconnection: connection established")
    } catch {
        print("func tryconnection: \(error)");
        throw error
    }
    return dataBase;
}

func removeSite (site : Site) -> Void{
    let row = cacheSettings.filter(host == site.host);
    do {
        try tryConnection().run(row.delete());
        print("func removeSite: row removed");
    } catch {
        print("func removeSite: \(error)");
    }
}

func prepareTable () throws -> AnySequence<Row> {
    let sequence : AnySequence<Row>;
    do {
        sequence = try tryConnection().prepare(cacheSettings);
        print("func prepareTable: table ready!");
        return sequence;
    } catch {
        print("func prepareTable: \(error)");
        throw error
    } 
}

func setTransparency (site : Site, value : Int) ->Void {
    let row = cacheSettings.filter(host == site.host);
    do{
        try tryConnection().run(row.update(transparency <- value));
        print("func setTransparency: transaprency updated");
    } catch {
        print("func setTransparency: \(error)");
    }
}

func numberOfSites () -> Int {
    do{
        var j = 0;
        for _ in try prepareTable() {
            j += 1;
        }
        return j;
    } catch {
        return 0
    }
}


func transparencyString (value : Int, sync : Int?) -> String {
    if (sync != nil) {
        switch(sync){
        case 1 :
            return "Glass, small"
            break
        case 2 :
            return "transparency, big"
            break
        case 3 :
            return "Glass, big"
            break
        default:
            return "select"
            break
            
        }
    } else {
        switch(value){
        case 1 :
            return "Glass, small"
            break
        case 2 :
            return "transparency, big"
            break
        case 3 :
            return "Glass, big"
            break
        default:
            return "select"
            break
            
        }
    }
}
