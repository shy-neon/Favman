//
//  Validation.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 02/04/23.
//

import Foundation


func checkKey (key : String) -> Bool{
    
    var keyInteger = Int(key) ?? 11;
    var sum = 0;

    while(keyInteger > 0) {
        sum = sum + (keyInteger) % 10;
        keyInteger = (keyInteger) / 10;
    }
    
    if(sum % 35 == 0 && keyInteger > 1000000){
        return true
    } else {
        return false
    }
}
