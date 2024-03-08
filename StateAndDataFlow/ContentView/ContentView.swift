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
        VStack {
            Text("Hi, \(loginViewVM.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.timerCounter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                title: contentViewVM.buttonTitle,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            ButtonView(title: "Logout", color: .blue, action: loginViewVM.logout)
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
