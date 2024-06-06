//
//  Validation.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 02/04/23.
//

import SwiftUI

struct Validation: View {
    
    @State var key : String = "";
    
    var body: some View {
        VStack{
            Text("Activate")
                .fontWeight(.bold)
                .font(.title)
            Text("If you donate 5$ or mare \nyou will recive on the paypal chat a key. \nInsert it below and the donate message \nwon't pop out anymore").multilineTextAlignment(.center)
                .padding()
            TextField("Enter key", text: $key).frame(width: 100)
            Button(action: <#T##() -> Void#>, label: <#T##() -> _#>).padding()
        }.padding()
    }
}

struct Validation_Previews: PreviewProvider {
    static var previews: some View {
        Validation()
    }
}
