//
//  ActivationView.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 03/04/23.
//

import SwiftUI

//struct ActivationView: View {
//
//    @Binding var active : Bool;
//    @State var key : String = "";
//
//    var body: some View {
//        VStack{
//            Text("Activate")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.top)
//            Text("If you donate 5$ or more you \nwill recive an Activation Key.\nBy activating Favtool the donation \nmessage won't be shown anymore.")
//                .padding()
//            HStack{
//                TextField(
//                        "Enter Key",
//                        text: $key
//                    )
//                .textFieldStyle(OvalTextFieldStyle())
//                .textFieldStyle(PlainTextFieldStyle())
//                .padding(1)
//                .background(RoundedRectangle(cornerRadius: 2).stroke(Color.white))
//                .frame(width: 130)
//                .padding(.bottom)
//
//                Button {
//                    active = checkKey(key: key)
//                } label: {
//                    Text("Activate")
//                }
//                .buttonStyle(BlueButton())
//                .padding(.bottom)
//
//            }
//        }
//
//    }
//}
//
//struct OvalTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .padding(10)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
//            .cornerRadius(10)
//            .shadow(color: .gray, radius: 5)
//    }
//}
//
//struct BlueButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(10)
//            .background(Color(red: 0, green: 0, blue: 0.5))
//            .foregroundColor(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//
//    }
//}
//
