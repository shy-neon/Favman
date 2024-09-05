//
//  SideBar.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 17/11/22.
//

import SwiftUI
import AppKit

struct SideBarView: View {
    
    @StateObject var sites = Sites()
    @State private var showingAlert = false
    @State var frequence = 0;
    @State private var active = false
    @State var selection : Site?; //sito attualmente selezionato
    
    
    var body: some View {
        NavigationView{
            
            List{
                if(sites.list.count != 0){
                    ForEach (sites.list) {item in
                        NavigationLink(destination:
                                        
                                        DetailView(sites: $sites),
                                       tag: item, selection: $selection){
                            Text(item.domainName)
                                .padding(.leading, 8.0)
                        }
                    }
                }else{
                    VStack{
                        
                        Image(systemName: "questionmark.folder.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70)
                            .foregroundColor(Color.gray)
                        Text("In order to work, Favtool needs to access the folder containig your favourite's data")
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .frame(width: 140)
                            .fixedSize(horizontal: false, vertical: true)
                        Button {
                            showSavePanel(path: touchIconFolder!)
                            ImageFolderIsLocked(false)
                            removeItems(path: touchIconCacheSettings!)
                            restartSafari()
                            
                        } label: {
                            Text("Grant Access")
                        }
                    }
                    .frame( width: 100, height: 350)
                    .padding(.leading, 20)
                    
                }
            }
            .listStyle(.sidebar)
            .frame(width: 190)
            .toolbar{
                
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action:{
                        showingAlert = true
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")})
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action:{
                        toggleSidebar()
                        
                    }, label: {
                        Image(systemName: "sidebar.left")})
                }
                
                ToolbarItem(placement: .navigation) {
                    Button(action:{
                       // if(frequence % 3 == 0){
                      //      active = true
                       // }
                        
                        restartSafari()
                        frequence += 1;
                    }, label: {
                        Text("Apply Changes")
                            .foregroundColor(.blue)
                    }).buttonStyle(.borderedProminent)
                }
                

                ToolbarItem(placement: .navigation) {
                    Button(action:{
                        if (selection != nil){
                            removeSite(site: selection!)
                            sites.list.removeAll{$0.id == sites.SiteWere(id: selection!.id).id}
                            selection = sites.list[0]
                        }
                    }, label: {
                        Image(systemName: "trash")})
                }
                
                
                
                ToolbarItem(placement: .navigation) {
                    Button(action: openReadme, label: {
                        Image(systemName: "info.circle")})
                }
                
            }.alert("All your custom icons will be set to Default. If you want to remove a specific site, consider using the trash tool", isPresented: $showingAlert) {
                Button("OK", role: .destructive) {
                    ImageFolderIsLocked(false)
                    removeItems(path: touchIconCacheSettings!)
                    restartSafari()
                    
                }
                
                }
            .alert("Developing Favtool is hard, show your love with a donation", isPresented: $active) {
                Button("Contribute") {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    donate()
                    }
                }
                Button("Maybe Later") {
                    
                }
            }
            
                DefaultView().environmentObject(sites)
            }
        }
    
    
    struct SideBar_Previews: PreviewProvider {
        static var previews: some View {
            SideBarView(selection: nullSite )
        }
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
   
    
    func openReadme() {
        let url = URL(string: "https://github.com/shy-neon/favtool/blob/main/README.md")!
        if NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
            
        }
    }
    
    
    
}
