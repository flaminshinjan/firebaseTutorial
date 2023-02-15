//
//  NewDogView.swift
//  firebaseTutorial
//
//  Created by Shinjan Patra on 14/02/23.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack{
            TextField("Dog", text: $newDog)
            Button{
                dataManager.addDog(dogbreed: newDog)
            } label: {
                Text("Save")
            }
        }
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView()
    }
}
