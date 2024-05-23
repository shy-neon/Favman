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
    
    var index : Int = 0;
    
    var body: some View {

        LazyVStack (alignment: .leading){
            Text(" \(sites.SiteWere(id: index).domainName)")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            HStack{
                self.sites.SiteWere(id: index).icon
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(width: 100)
                    .shadow(radius: 7)
                    .padding(.bottom)
                
                
                VStack(alignment: .leading){
                    Text("Icon Style:")
                        .padding(.leading, -10)
                    MenuButton(label: Text({transparencyString(value: self.sites.list[index].transparencyResult)
                    }())) {
                        Button("Glass, Small", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 0)
                            sites.list[index].setTransparency(value: 0)
                        })
                        Button("Transparent, Big", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 1)
                            print(sites)
                            sites.list[index].setTransparency(value: 1)
                        })
                        Button("Glass, Big", action: {
                            setTransparency(site: sites.SiteWere(id: index), value: 3)
                            sites.list[index].setTransparency(value: 3)
                        })
                     
                    }
                    .frame(width: 150)
                    .padding(.leading, -10)
                }
                .padding(.leading, 50)
            }
//                VStack(){
//
//                    Picker(selection: $selected, label: Text("Icon Size:")) {
//                                    Text("Big").tag(1)
//                                    Text("Small").tag(2)
//                                }
//                                .pickerStyle(.radioGroup)
//                                .padding(.leading, -20)
//                                .padding(.bottom, 10)
//
//
//                    Picker(selection: $selected, label: Text("Back:")) {
//                                    Text("Transparent").tag(1)
//                                    Text("Glass").tag(2)
//                                }
//                                .pickerStyle(.radioGroup)
//
//                }
//                .padding(.leading, 30)
//                .padding(.bottom, 30)
//
//            }

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

