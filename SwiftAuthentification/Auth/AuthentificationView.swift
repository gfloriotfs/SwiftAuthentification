//
//  AuthentificationView.swift
//  SwiftAuthentification
//
//  Created by Graydon Florio on 2023-04-28.
//

import SwiftUI

struct AuthentificationView: View {
    var body: some View {
        VStack{
            NavigationLink
            {
                SignInEmailView()
            }
        label:{
                Text("Se connecter avec Email") .font(.headline).foregroundColor(.white).frame(height: 55) .frame(maxWidth: .infinity) .background(Color.blue).cornerRadius(10)
        }
            Spacer()
        }
        .padding()
        .navigationTitle("Se Connecter")
    }
}

struct AuthentificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack
        {
            AuthentificationView()
        }
    }
}
