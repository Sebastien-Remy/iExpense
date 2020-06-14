//
//  ContentView.swift
//  iExpense
//
//  Created by Sebastien REMY on 14/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct secondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Button("Hello \(name)") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    
    @State private var shohwingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            self.shohwingSheet.toggle()
        }
        .sheet(isPresented: $shohwingSheet) {
            secondView(name: "Seb")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
