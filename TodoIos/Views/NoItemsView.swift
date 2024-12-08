//
//  NoItemsView.swift
//  TodoIos
//
//  Created by Hamad on 08/12/2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false

    var body: some View {
        ScrollView {
            VStack {
                Text("Your Todo List Is Empty!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You can add tasks as Todos that will be stored locally. You can come back later to mark them complete or incomplete based on task status.")
                    .font(.callout)
                    .padding(.bottom, 30)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add NOTE  👈")
                            .foregroundColor(.white)
                            .font(animate ? .title2 : .title3)
                            .fontWeight(.medium)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.blue)
                            .cornerRadius(8)
                    }
                )
                .padding(.horizontal, animate ? 40 : 50)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -5 : 0)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.5),
                    radius: animate ? 30 : 10,

                    x: 0,
                    y: animate ? 30 : 20
                )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
                .padding(30)
                .onAppear(perform: addAnimationEffect)
        }
    }

    func addAnimationEffect() {
        if animate { return }

        // toggle 'animate' value after 1.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now()) {
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
    NoItemsView()
}
