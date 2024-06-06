//
//  DefaultView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 27/11/22.
//

import SwiftUI



struct DefaultView: View {
    
    @EnvironmentObject var sites : Sites
    
    var body: some View {
        
        VStack {
            
            Image("logo")
                .resizable()
                .scaledToFill()
                .padding(.bottom, 30)
                .frame(width: 300, height: 150)

                Text("Select a Site")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .offset(y: -55)
                Text("Reddit: **u/Shyne-on** join **r/favtool**")
                    .foregroundColor(Color.gray)
                    .offset(y: 90)
        }
    }
}


struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView().environmentObject(Sites())
    }
}
