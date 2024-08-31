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
                
            Text("Version 4.5 Pro")
                .font(.headline)
                .padding(.bottom, 3)
            Text("Designed, developed and distribuited by Shy Neon\n \n Reddit: u/Shyne-on")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
            
            HStack{
                Button(action: goInstagram, label: {Image("instagram").resizable().scaledToFill().frame(width: 34, height: 34)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                Button(action: goReddit, label: {Image("reddit").resizable().scaledToFill().frame(width: 25, height: 25)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                Button(action: goTelegram, label: {Image("telegram").resizable().scaledToFill().frame(width: 28, height: 28)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                
            }
            
        }
        .frame(width: 300)
        
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
