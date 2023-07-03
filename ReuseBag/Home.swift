//
//  Home.swift
//  ReuseBag
//
//  Created by funghi on 2023/5/20.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct Home: View {
    @EnvironmentObject var loginModel: LoginViewModel
    
    var body: some View {
        TabView {
            GlobalView().tabItem {
                NavigationLink(destination: GlobalView().environmentObject(loginModel)) {
                    Image(systemName: "globe")
                    Text("Global")
                }
            }
            MarketView().tabItem {
                NavigationLink(destination: MarketView().environmentObject(loginModel)) {
                    
                    Image(systemName: "cart")
                    Text("Market")
                }
            }
            RebagView().tabItem {
                NavigationLink(destination: RebagView().environmentObject(loginModel)) {
                    
                    Image(systemName: "bag")
                    Text("Rebag")
                }
            }
            PersonPage().tabItem {
                NavigationLink(destination: PersonPage().environmentObject(loginModel)){
                    Image(systemName: "person")
                    Text("Person")
                }
            }
        }
        .onAppear {
            loginModel.async()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

