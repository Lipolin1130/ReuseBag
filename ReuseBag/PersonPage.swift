//
//  PersonPage.swift
//  ReuseBag
//
//  Created by funghi on 2023/5/20.
//

import SwiftUI

struct PersonPage: View {
    @EnvironmentObject var loginModel: LoginViewModel
    var body: some View {
        
        VStack {
            Button {
                loginModel.logOut()
            } label: {
                Text("登出")
            }
        }
    }
}

struct PersonPage_Previews: PreviewProvider {
    static var previews: some View {
        PersonPage()
    }
}
