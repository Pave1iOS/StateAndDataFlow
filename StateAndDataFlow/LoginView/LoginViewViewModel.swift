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
    @Published var isDisabled = true

    func logout() {
        isLoggedIn.toggle()
        name = ""
        isDisabled = true
    }
    
    func isValidation(value: Int, isValidationTrue:() -> Void, isValidationFalse:() -> Void) {
        if value >= 3 {
            isDisabled = false
            isValidationTrue()
        } else {
            isDisabled = true
            isValidationFalse()
        }
    }
}
