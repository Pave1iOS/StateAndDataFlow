//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
        
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                
                TextView(loginViewVM: loginViewVM)
            }
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(loginViewVM.isDisabled)
        }
    }
    
    private func login() {
        let dataStore = DataStore.shared
        
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
        dataStore.save(loginViewVM.name, isLoggedIn: loginViewVM.isLoggedIn)
    }
}

struct TextView: View {
    @ObservedObject var loginViewVM: LoginViewViewModel
    @State private var color = Color(.red)
    
    var body: some View {
        Text(loginViewVM.name.count.formatted())
            .foregroundStyle(color)
            .frame(width: 50)
            .onChange(of: loginViewVM.name.count) { _, newValue in
                loginViewVM.isValidation(
                    value: newValue) {
                        color = .green
                    } isValidationFalse: {
                        color = .red
                    }
            }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
