//
//  ContentView.swift
//  ReuseBag
//
//  Created by funghi on 2023/5/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loginModel = LoginViewModel()
    var body: some View {
        if loginModel.logStatus {
            Home()
                .environmentObject(loginModel)
        } else {
            LoginPage()
                .environmentObject(loginModel)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
