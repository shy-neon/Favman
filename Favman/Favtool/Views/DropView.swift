//
//  DropView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 18/11/22.
//

import SwiftUI

struct DropView: View {
    
    @EnvironmentObject var sites : Sites;
    
    @State var icon = "tray.and.arrow.down";
    @State var color  = Color(.gray);
    @State var text  = "Drop Here Your Icon";
    
    var index : Int;
    @Binding var ischanged : Bool;
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("silver"))
                .frame(width: 345, height: 130)
            
            LazyVStack {
                Image(systemName: icon)
                    .symbolRenderingMode(.hierarchical)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color)
                 
                Text(text)
                    .foregroundColor(Color.gray)
                    .padding(.top, 10)
            }
        }
        .padding(.bottom, 20)
        .padding(.top, 10)
        .onDrop(of: [.fileURL], isTargeted: nil) {
            providers in dropAction(providers: providers, site: sites.SiteWere(id: index))
        }
    }
    
    func dropAction (providers : [NSItemProvider], site : Site) -> Bool {
        if let provider = providers.first(where: { $0.canLoadObject(ofClass: URL.self) }) {
            let _ = provider.loadObject(ofClass: URL.self) { object, error in
                if let url = object {
                    touchFolderIsLocked(false);
                    ImageFolderIsLocked(false)
                    ischanged = !ischanged;
                    copyImage(url, for: site)
                    setIconIsOnChache(site: site)
                    ischanged = !ischanged;
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    }
                    icon = "checkmark.seal.fill"
                    color = Color(.systemGreen)
                    text = "Done, Apply Changes"
                    touchFolderIsLocked(true);
                    print("Func dropAction: url \(url.lastPathComponent)")
                }
            }
            
            return true
        }
        return false
    }
}


