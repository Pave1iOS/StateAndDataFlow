//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    let user = User.getUser()
    
    @Published var name: String
    @Published var isLoggedIn: Bool
    @Published var isDisabled = true
    
    init() {
        name = user.name
        isLoggedIn = user.isLoggedIn
    }

    func logout() {
        isLoggedIn.toggle()
        name = ""
        isDisabled = true
        
        user.deleteUser()
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
