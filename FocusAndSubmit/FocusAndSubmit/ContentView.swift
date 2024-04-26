//
//  ContentView.swift
//  FocusAndSubmit
//
//  Created by mac on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    
    enum AddressField {
        case streetName
        case city
        case state
        case zipCode
    }
    
    @State private var streetName = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    
    var body: some View {
        VStack {
            TextField("Address", text: $streetName)
                .focused($currentFocus, equals: .streetName) // Focus가 들어왔을때
                .submitLabel(.next) //키보드의 returnValue
            TextField("City", text: $city)
                .focused($currentFocus, equals: .city)
                .submitLabel(.next)
            TextField("State", text: $state)
                .focused($currentFocus, equals: .state)
                .submitLabel(.next)
            TextField("ZipCode", text: $zipCode)
                .focused($currentFocus, equals: .zipCode)
                .submitLabel(.done) // done
        }
        .padding()
        .onSubmit {
            switch currentFocus {
            case .streetName:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("Done!!")
            }
        }
        .onAppear {
            currentFocus = .streetName
        }
    }
}

#Preview {
    ContentView()
}
