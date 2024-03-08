//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    @State private var disabled = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                
                TextView(text: loginViewVM, disabled: $disabled)
            }
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }.disabled(disabled)
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

struct TextView: View {
    @ObservedObject var text: LoginViewViewModel
    @State private var color = Color(.red)
    @Binding var disabled: Bool
    
    var body: some View {
        Text(text.name.count.formatted())
            .foregroundStyle(color)
            .frame(width: 50)
            .onChange(of: text.name.count) { _, newValue in
                if newValue >= 3 {
                    color = .green
                    disabled = false
                } else {
                    color = .red
                    disabled = true
                }
            }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
