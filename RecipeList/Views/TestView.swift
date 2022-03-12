//
//  TestView.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/11/22.
//

import SwiftUI

struct TestView: View {
    @State var selectedItem = 1
    var body: some View {
        VStack{
            Picker("Select Below", selection: $selectedItem) {
                     //options the user should select
                Text("Option 1").tag(1)
                Text("Option 2").tag(2)
                Text("Option 3").tag(3)
                    }
                Text("Option: \(selectedItem) is selected.")
        }
        .pickerStyle(SegmentedPickerStyle())
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
