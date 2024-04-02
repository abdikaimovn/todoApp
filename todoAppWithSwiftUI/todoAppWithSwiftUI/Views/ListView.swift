//
//  ListView.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 31.03.2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            } 
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.move)
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),             trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
