//
//  todoAppWithSwiftUIApp.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 31.03.2024.
//

import SwiftUI

@main
struct todoAppWithSwiftUIApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
