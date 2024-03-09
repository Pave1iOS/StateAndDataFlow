//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) var contentViewVM
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack {
                    Text("Hi, \(loginViewVM.name)!")
                        .padding([.top, .bottom], 20)
                        .font(.largeTitle)
                        .italic()
                        .foregroundStyle(.black)
                        .shadow(radius: 10)
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 50)
                            .frame(width: 320)
                            .foregroundStyle(.black)
                        
                        Circle()
                            .frame(width: 200)
                            .foregroundStyle(.red)
                            .foregroundStyle(.black)
                            .shadow(color: .gray, radius: 5)
                        
                        Text(contentViewVM.timerCounter.formatted())
                            .font(.system(size: 150))
                            .bold()
                            .foregroundStyle(.black)
                }
                
                Spacer()
                
                ZStack {
                    Color.gray
                        .ignoresSafeArea()
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2))
                        .foregroundStyle(.black)
                        .opacity(0.7)
                        .padding(.bottom, -35)
                    
                    VStack {
                        ButtonView(
                            title: contentViewVM.buttonTitle,
                            action: contentViewVM.startTimer
                        )
                        .padding([.bottom, .top], 25)
                        
                        ButtonView(title: "Logout", color: .blue, action: loginViewVM.logout)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    var title: String
    var color = Color.red
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
