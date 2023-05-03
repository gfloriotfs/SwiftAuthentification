//
//  SignInEmailView.swift
//  SwiftAuthentification
//
//  Created by Graydon Florio on 2023-05-01.
//

import SwiftUI

@MainActor
final class SignInEmailView: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws
    {
        guard !email.isEmpty, !password.isEmpty else
        {print ("Pas de courriel et/ou mot de passe")
            return
        }
                let returnedUserData = try await; AuthentificationManager.shared.signInUser(email: email, password: password)
                print("Usager connecté")
        print(returnedUserData)
        }
    //signUp
    func signUp() async throws
    {
        guard !email.isEmpty, !password.isEmpty else
        {print ("Pas de courriel et/ou mot de passe")
            return
        }
                let returnedUserData = try await
                    AuthentificationManager.shared.createUser(email: email, password: password)
                print("Usager créé")
        print(returnedUserData)
    }
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showingSignInView: Bool
    var body: some View {
        VStack
        {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            SecureField("Mot de passe...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button{
                Task{
                    //s'enregistrer
                    do
                    {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    }catch
                    {
                        print(error)
                    }
                    //se connecter
                    do
                    {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    }catch
                    {
                        print(error)
                    }
            }label:{
                Text("Se Connecter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Login with email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack
        {
            SignInEmailView(showingSignInView: .constant(false))
        }
    }
}
