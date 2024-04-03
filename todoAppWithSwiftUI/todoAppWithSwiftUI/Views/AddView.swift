//
//  AddView.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 31.03.2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var text: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something", text: $text)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                Button(action: addButtonPressed) {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(14)
        }
        .navigationTitle("Add an item")
    }
    
    private func addButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addNewItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if text.count < 3 {
            return false
        }
        
        return true
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
