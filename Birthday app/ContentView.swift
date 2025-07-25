//
//  ContentView.swift
//  Birthday app
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Query private var friends:[Friend]
    @Environment(\.modelContext) private var context
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
                List {
                    ForEach(friends) { friend in
                        HStack {
                            HStack {
                                Text(friend.name)
                                Spacer()
                                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                            }
                        }
                    }
                    .onDelete(perform: deleteFriend)
                }
            }
        }
        .padding()
    }
    func deleteFriend(at offsets: IndexSet){
        for index in offsets{
            let friendToDelete = friends[index]; context.delete (friendToDelete)
            
                                
        }
    }
}

#Preview {
    ContentView()
            .modelContainer(for: Friend.self, inMemory: true)

}
