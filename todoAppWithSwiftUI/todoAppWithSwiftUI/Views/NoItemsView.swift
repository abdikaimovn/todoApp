//
//  NoItemsView.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 03.04.2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    private let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the button add a bunch of items to your toDo list!")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add an item 📎")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                    x: 0.0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func addAnimation() {
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Hello")
    }
}
