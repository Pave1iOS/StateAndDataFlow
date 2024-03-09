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
    
    func save(_ user: String, isLoggedIn: Bool) {
        self.user = user
        self.isLoggedIn = isLoggedIn
    }
    
    func delete() {
        
    }
        
    private init(){}
}

// сохранение данных

// восстановление данных

// удаление данных
