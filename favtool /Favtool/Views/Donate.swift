//
//  Donate.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 02/04/23.
//

import SwiftUI

struct Donate: View {
    var body: some View {
        VStack{
            Text("If you like favtool make a donation  ☕️")
            HStack{
                Button("donate", action: donate).foregroundColor(Color(.blue))
                Button("Maybe later", action: donate)
            }
            
        }.padding()
    }
    
    struct Donate_Previews: PreviewProvider {
        static var previews: some View {
            Donate()
        }
    }
}
