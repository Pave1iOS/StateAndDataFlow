//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Pavel Gribachev on 08.03.2024.
//

import Foundation
import SwiftUI

final class DataStore {
    static let shared = DataStore()
    
    @AppStorage("user") var user = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    private init(){}
    
    func saveUser(_ user: String, isLoggedIn: Bool) {
        self.user = user
        self.isLoggedIn = isLoggedIn
    }
    
    func deleteUser() {
        user = ""
        isLoggedIn = false
    }
}
