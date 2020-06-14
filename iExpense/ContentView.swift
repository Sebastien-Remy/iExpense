//
//  ContentView.swift
//  iExpense
//
//  Created by Sebastien REMY on 14/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI


struct PrimaryLabel: ViewModifier {
    
    var amount: Int
    
    func body(content: Content) -> some View {
        content
        .frame(width: 100, height:40)
            .background(backgroundColor())
            .foregroundColor(.white)
            .cornerRadius(2)
    }
    
    func backgroundColor() -> Color {
        switch amount {
        case 0...10:
            return Color.black
        case 11...99:
            return Color.blue
        default:
            return Color.orange
        }
    }
}

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                            .modifier(PrimaryLabel(amount: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
