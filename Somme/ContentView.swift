//
//  ContentView.swift
//  Somme
//
//  Created by Federico on 12/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State private var result = ""
    @State var number1 = Int.random(in: 1..<100)
    @State var number2 = Int.random(in: 1..<100)
    @State var message = ""
    
    var body: some View {
        
        VStack {
            VStack {
                VStack{
                    Text("Somme")
                        .font(.system(size: 60))
                        .padding()
                    
                    Text("\(number1)+\(number2)")
                        .font(.system(size: 30))
                        .padding()
                    Text("=").font(.system(size: 30)).padding()
                }
                TextField("0", text: $result)
                    .padding()
                    .keyboardType(.decimalPad)
                    .frame(width: 120, height: nil)
                    .textFieldStyle(.roundedBorder)
            }
            Button("Verifica") {
                showingAlert = true
                print("\(number1) \(number2)")
                if(Int(result) == number1+number2){
                    self.message = "Bene! È esatto"
                    self.number1 = Int.random(in: 1..<100)
                    self.number2 = Int.random(in: 1..<100)
                    self.result = "0"
                } else {
                    self.message = "Oh no! Riprova"
                }
            }
            .foregroundColor(Color.white)
            .frame(width: 100, height: 50)
            .background(Color.blue)
            .cornerRadius(8)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Esito"), message: Text(self.message), dismissButton: .default(Text("Chiudi")))
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
