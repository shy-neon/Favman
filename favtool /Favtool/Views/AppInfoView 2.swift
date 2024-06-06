//
//  AppInfoView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 27/11/22.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        LazyVStack{
            Image("Icon")
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .frame(width: 100)
                .padding(.vertical, 3)
                .padding(.top, 3)
                
            Text("Version 4.0.1")
                .font(.headline)
                .padding(.bottom, 3)
            Text("Designed, developed and distribuited by Shy Neon\n \n Reddit: u/Shyne-on")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
            
            Button {
                
            } label: {
                Text("Acknowledgments")
            }
            .padding()
            
        }
        .frame(width: 300)
        
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
