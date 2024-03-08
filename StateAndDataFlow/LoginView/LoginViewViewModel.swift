//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var isLoggedIn = false
    
    func logout() {
        isLoggedIn.toggle()
        name = ""
    }
    
    func isValidation(value: Int, isValidationTrue:() -> Void, isValidationFalse:() -> Void) {
        if value >= 3 {
            isValidationTrue()
        } else {
            isValidationFalse()
        }
    }
}
