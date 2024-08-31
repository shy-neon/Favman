//
//  DetailView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 18/11/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var sites : Sites
    @State private var selected = 1
    var id: Int = 0
    @State var change : Bool = false;
    var index : Int = 0;
    @State private var isVisible = false
    
    var body: some View {

        VStack (alignment: .leading){
            HStack{
                Text(" \(sites.SiteWere(id: index).domainName)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Button(action: {isVisible.toggle()}, label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.gray)
                }).buttonStyle(BorderlessButtonStyle()).padding(4)
                    .popover(isPresented: $isVisible, content: {
                        VStack(alignment: .leading){
                            Text("Host: " + sites.SiteWere(id: index).host)
                            Text("MD5: " + sites.SiteWere(id: index).md5)
                        }
                        .padding(10)
                    })
                    .onHover { inside in
                        if inside {
                            NSCursor.pointingHand.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
            }
            
            HStack{
                AsyncImage(url: {change ? URL(string: "bog") : sites.SiteWere(id: index).iconPath}()) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image("null")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(width: 100)
                    .shadow(radius: 7)
                    .padding(.bottom)
            }
            DropView(index: index, ischanged: $change)
            
        }
        .padding(.horizontal, 30)
        HStack{
            Text("Join r/favtool or contact me on telegram")
                .foregroundStyle(.gray)
            Button(action: goReddit, label: {Image("reddit").resizable().scaledToFill().frame(width: 15, height: 15)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                if inside {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }
            }
            Button(action: goTelegram, label: {Image("telegram").resizable().scaledToFill().frame(width: 18, height: 18)}).buttonStyle(BorderlessButtonStyle()).padding(4).onHover { inside in
                if inside {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }
            }
        }
        
    }
}

