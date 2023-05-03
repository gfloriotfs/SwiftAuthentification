//
//  RootView.swift
//  SwiftAuthentification
//
//  Created by Graydon Florio on 2023-05-01.
//

import SwiftUI

struct RootView: View {
    @State private var showingSignInView:Bool = false
    var body: some View {
        ZStack
        {
            NavigationStack
            {
                SettingsView(showingSignInView: $showingSignInView)
            }
        }
        .onAppear()
        {
            let authuser = try? AuthentificationManager.shared.getAuthenticatedUser()
            self.showingSignInView = authuser == nil
        }
        .fullScreenCover(isPresented: $showingSignInView)
        {
            NavigationStack
            AuthentificationView(showSignInView: $showingSignInView)
            }
        }
    }

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
