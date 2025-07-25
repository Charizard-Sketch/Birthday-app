//
//  ContentView.swift
//  Birthday app
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends:[Friend] = [
        Friend(name: "Alexa", birthday: .now)
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        List(friends, id: \.name ){ friend in
            HStack{
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            
         }
            
        }
        navigationTitle("Birthdays")
        safeAreaInset(edge: .bottom){
            VStack(alignment: .center, spacing: 20 ){
                Text("New Birthday")
                    .font(.headline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
