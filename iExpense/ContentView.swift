//
//  ContentView.swift
//  iExpense
//
//  Created by Sebastien REMY on 14/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
            .onDelete(perform: removeItems)
            }
        .navigationBarTitle("iExpense")
        .navigationBarItems(trailing:
            Button(action: {
                let expense = ExpenseItem(name: "Test", type: "Personnal", amount: 5)
                self.expenses.items.append(expense)
            
            }) {
                Image(systemName: "plus")
            })
        }
    }
    
    func removeItems(at offSets: IndexSet) {
        expenses.items.remove(atOffsets : offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
