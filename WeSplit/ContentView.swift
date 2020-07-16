//
//  ContentView.swift
//  WeSplit
//
//  Created by Arthur Mendonça Sasse on 13/07/20.
//  Copyright © 2020 Arthur Mendonça Sasse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
//    @State private var numberOfPeople = 2
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalValues: [Double] {
//        let peopleCount = Double(numberOfPeople + 2)
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount * tipSelection / 100
        let totalAmount = orderAmount + tipValue
        let amountPerPerson = totalAmount / peopleCount
        
        return [amountPerPerson, totalAmount]
    }
    
    var body: some View {
        NavigationView{
            Form {
                
                Section{
                    TextField("Valor", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                    Picker("Número de Pessoas", selection: $numberOfPeople){
//                        ForEach(2 ..< 100){
//                            Text("\($0) people")
//                        }
//                    }
                    TextField("Número de Pessoas", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Quanto você quer dar de gorjeta?")){
                    Picker("Gorjeta", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Valor total com gorjeta")) {
                    Text("R$ \(totalValues[1], specifier: "%.2f")")
                }
                
                Section (header: Text("Valor por pessoa")){
                    Text("R$ \(totalValues[0], specifier: "%.2f")")
                    //Text("R$ \(totalValues)")
                }
                
            .navigationBarTitle("WeSplit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
