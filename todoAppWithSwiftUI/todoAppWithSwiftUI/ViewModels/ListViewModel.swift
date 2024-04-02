//
//  ListViewModel.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 02.04.2024.
//

import Foundation

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveData()
        }
    }
    private let dataKey = "items_list"
    
    init() {
        getItems()
    }
    
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: dataKey) else {
            return
        }
        
        if let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data) {
            items = decodedData
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveData()
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        saveData()
    }
    
    func addNewItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        saveData()
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
            saveData()
        }
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: dataKey)
        }
    }
}
