//
//  LoginViewModel.swift
//  ReuseBag
//
//  Created by funghi on 2023/5/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showError: Bool = false
    @Published var name: String = ""
    @Published var errorMsg: String = ""
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    let db = Firestore.firestore()
    
    func loginUser()async throws {
        let _ = try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func sendEmail(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func logOut() {
        try? Auth.auth().signOut()
        logStatus = false
    }
    
    func register()async throws {
        let _ = try await Auth.auth().createUser(withEmail: email, password: password)
        
        let _ = try await self.db.collection("user").document(email).setData(["email": email, "name": name])
    }
    
    func async() {
        let _ = Auth.auth().addStateDidChangeListener{auth, user in
            let user = Auth.auth().currentUser
            if let user = user {
                print(user.email ?? "error email")
                self.email = user.email ?? "error email"
            }
            self.db.collection("user").document(self.email).getDocument{(document, error) in
                if let document = document {
                    print("Cached document data: \(document.data()?["name"] ?? "none")")
                    self.name = document.data()?["name"] as! String
                    
                } else {
                    print("document is empty")
                }
            }
        }
    }
}
