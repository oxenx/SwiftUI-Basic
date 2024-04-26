//
//  SignUpView.swift
//  SignUp
//
//  Created by mac on 4/26/24.
//

import SwiftUI

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}


struct SignUpView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThenTwo = false
    @State private var userName = ""
    @State private var password = ""
    @State private var userNameError = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Names") {
                    TextField("Frist Name", text: $firstName)
                    if !userNameError.isEmpty {
                        Text(userNameError)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                    TextField("Last Name", text: $lastName)
                }
                
                Section("Current Address") {
                    TextField("Street Address", text: $address.street)
                    TextField("City", text: $address.city)
                    TextField("PostalCode", text: $address.postalCode)
                    Toggle(isOn: $lessThenTwo) {
                        Text("Have you lived here for 2+ year")
                    }
                }
                
                if !lessThenTwo {
                    Section("Previous Address") {
                        TextField("Street Address", text: $address2.street)
                        TextField("City", text: $address2.city)
                        TextField("PostalCode", text: $address2.postalCode)
                    }
                }
                
                Section {
                    TextField("Create UserName", text: $userName)
                    SecureField("Create Password", text: $password)
                }
                
                Button("Submit") {
                    userNameError = "UserName을 입력하세요."
                    print("Form submit action here")
                }
                
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
