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
               
                .frame(width: 300, height: 150)
            Text("Patreon edition")
                .font(.headline)
                .foregroundColor(Color.gray)
                .padding(.top, -50)
            
            Text("Select a Site")
                    .foregroundColor(Color.gray)
                   
            
            VStack{
                
                    
                    
                
             
            }
        }
    }
}


struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView().environmentObject(Sites())
    }
}
