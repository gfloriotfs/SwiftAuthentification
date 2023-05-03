//
//  AuthentificationManager.swift
//  SwiftAuthentification
//
//  Created by Graydon Florio on 2023-05-01.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user : User)
    {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthentificationManager{
    static let shared=AuthentificationManager()
    private init() {}
    
    func createUser(email:String, password:String) async throws -> AuthDataResultModel
    {
        let authDataResult=try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    //recupérer les données de l'usager
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user:user)
    }
    //connecté un usager déjà enregistré
    func signInUser(email: String, password: String) async throws->AuthDataResultModel
    {
        let authDataResult=try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    //Quitter
    func signOut() throws
    {
        try Auth.auth().signOut()
    }
    //reset mot de passe
    func resetPassword(email: String) async throws
    {
    try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}
