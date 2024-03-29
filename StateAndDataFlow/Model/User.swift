//
//  User.swift
//  StateAndDataFlow
//
//  Created by Pavel Gribachev on 09.03.2024.
//

import Foundation

struct User {
    let name: String
    let isLoggedIn: Bool
    
    static func getUser() -> User {
        let dataStore = DataStore.shared
        
        return User(name: dataStore.user, isLoggedIn: dataStore.isLoggedIn)
    }
    
    func saveUser(_ user: String, isLoggedIn: Bool) {
        DataStore.shared.saveUser(user, isLoggedIn: isLoggedIn)
    }
    
    func deleteUser() {
        DataStore.shared.deleteUser()
    }
}
