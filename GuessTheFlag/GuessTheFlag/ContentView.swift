//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Naveen Singisetty on 31/03/20.
//  Copyright © 2020 MouriTech Pvt. Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 20, endRadius: 200)
            Button(action: {
                self.showingAlert = true
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("Tap me")
                }
            }
            .alert(isPresented: $showingAlert) { () -> Alert in
                Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            }
//                .background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
