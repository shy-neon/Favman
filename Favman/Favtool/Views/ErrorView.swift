//
//  ErrorView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 27/11/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Favtool need access to image folder, grant access and restart Favtool")
        Button {
            showSavePanel()
        } label: {
            Text("TeGrantAccess")
        }

    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
