//
//  SideBar.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 17/11/22.
//

import SwiftUI
import AppKit

struct SideBarView: View {
    
    @State var sites = Sites()
    @State private var showingAlert = false
    @State var frequence = 0;
    @State private var active = false
    @State var selection : Site?; //sito attualmente selezionato
    @State var refreshing = false;
    @State var progress = 0.00;
    @State var filemangererror = "Authorize access to the favourite folder"
    @State var granted = 0;
    
    var body: some View {
        NavigationView{
            
            List{
                if(refreshing){
                    VStack{
                        
                        Text("creating list")
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .foregroundColor(Color.gray)
                            .frame(width: 140)
                            .fixedSize(horizontal: false, vertical: true)
                        ProgressView(value: progress);
                    }.frame( width: 100, height: 350)
                        .padding(.leading, 20)
                }
                else if(sites.list.count != 0 && !refreshing){
                    ForEach (sites.list) {item in
                        NavigationLink(destination:
                                        
                                        DetailView(sites: sites, index: item.id).environmentObject(sites),
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
                        Text(filemangererror)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .frame(width: 140)
                            .fixedSize(horizontal: false, vertical: true)
                        Button {
                            showSavePanel(path: touchIconFolder!)
                            filemangererror = ImageFolderIsLocked(false)
                            restartSafari()
                            refreshList()
                       
                            granted = 1;
                        } label: {
                            if(granted == 0){
                                Text("Grant Access")
                            } else {
                                Text("try again")
                            }
                            
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
                        Image(systemName: "arrow.counterclockwise.circle")})
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action:{
                        toggleSidebar()
                        
                    }, label: {
                        Image(systemName: "sidebar.left")})
                }
                
                ToolbarItem(placement: .navigation) {
                    Button(action:{
                        if(frequence % 3 == 0){
                            active = true
                        }
                        
                        restartSafari()
                        frequence += 1;
                    }, label: {
                        Text("Apply Changes")
                            .foregroundColor(.blue)
                    }).buttonStyle(.borderedProminent)
                }
                
                ToolbarItem(placement: .navigation) {
                    Button(action: openReadme, label: {
                        Image(systemName: "book.and.wrench")})
                }
                
            }.alert("All your custom icons will be set to Default. If you want to remove a specific site, consider using the trash tool", isPresented: $showingAlert) {
                Button("OK", role: .destructive) {
                    filemangererror = touchFolderIsLocked(false)
                    removeItems(path: touchIconCacheSettings!)
                    restartSafari()
                    refreshList()
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
    
    func refreshList(){
        refreshing = true;
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){sites = Sites(); progress = 0.3}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){sites = Sites() ; progress = 0.4}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){sites = Sites(); progress = 0.45}
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){sites = Sites(); progress = 0.6}
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0){sites = Sites(); progress = 0.7}
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0){sites = Sites(); progress = 1}
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0){sites = Sites(); refreshing = false}
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0){sites = Sites()}
        DispatchQueue.main.asyncAfter(deadline: .now() + 15.0){sites = Sites()}
        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0){sites = Sites()}
        DispatchQueue.main.asyncAfter(deadline: .now() + 25.0){sites = Sites()}
        DispatchQueue.main.asyncAfter(deadline: .now() + 30.0){sites = Sites()}
    }
    
}
