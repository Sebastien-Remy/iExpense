//
//  ContentView.swift
//  iExpense
//
//  Created by Sebastien REMY on 14/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (numbers, id: \.self) {
                        Text ("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
        .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offSets: IndexSet) {
        numbers.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
