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
                .frame(width: 200, height: 55)

                Text("Select a Site")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                                
            VStack{
                Text("Help me with a donation or a follow")
                    
                    .foregroundColor(Color.gray)
                
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
                    
                    Button(action: donate, label: {Image("paypal").resizable().scaledToFill().frame(width: 27, height: 27)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                        if inside {
                            NSCursor.pointingHand.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
                    
                    
                }.offset()
            }
        }
    }
}


struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView().environmentObject(Sites())
    }
}
