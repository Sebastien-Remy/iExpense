//
//  AddView.swift
//  iExpense
//
//  Created by Sebastien REMY on 14/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personnal"
    @State private var amount = ""
    
    static let types = ["Business", "Personnal"]
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
        }    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}