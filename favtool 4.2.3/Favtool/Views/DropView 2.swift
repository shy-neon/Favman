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
                    ImageFolderIsLocked(false)
                    copyImage(url, for: site)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    }
                    icon = "checkmark.seal.fill"
                    color = Color(.systemGreen)
                    text = "Done, restart Safari to apply changes"
                    ImageFolderIsLocked(true)
                    print("Func dropAction: url \(url.lastPathComponent)")
                }
            }
            
            return true
        }
        return false
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView(index: 3)
    }
}



