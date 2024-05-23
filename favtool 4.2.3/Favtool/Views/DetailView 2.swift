//
//  DetailView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 18/11/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var sites : Sites
    var index : Int = 0;
    
    var body: some View {

        LazyVStack (alignment: .leading){
            Text(" \(sites.SiteWere(id: index).domainName)")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom)
            
            HStack{
                sites.SiteWere(id: index).icon
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(width: 100)
                    .shadow(radius: 7)
                    .padding(.bottom)
                
        
                VStack{
                    Text("Icon and Bacgkround Style")
                    MenuButton(label: Text("\(sites.SiteWere(id: index).transparencyResult)")) {
                        Button("Glass, Small", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 0)
                            sites.list[index].transparencyResult = 0
                        })
                        Button("Transparent, Big", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 1)
                            print(sites)
                        })
                        Button("Glass, Big", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 3)
                        })
                    }
                    .frame(width: 100)
                    .padding(.leading, -60)
                }
                .padding(.leading, 50)
            }

            Text(" Host: \(sites.SiteWere(id: index).host)")
                .foregroundColor(Color.gray)
            Text(" MD5: \(sites.SiteWere(id: index).md5)")
                .foregroundColor(Color.gray)
                .padding(.bottom, 6)
            
            DropView(index: index)
        }
        .padding(.horizontal, 30)
    }
}

