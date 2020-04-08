//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Naveen Singisetty on 31/03/20.
//  Copyright © 2020 MouriTech Pvt. Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:30) {
                VStack {
                    Text("Tap the flag")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(totalScore)"), dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                    })
            }
        }
    }
    
    func flagTapped(_ number:Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            totalScore -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
//        totalScore = 0
        
    }
    
    
    
    
   /*
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
 */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
