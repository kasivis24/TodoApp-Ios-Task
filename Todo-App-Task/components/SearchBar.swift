//
//  SearchBar.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 05/12/25.
//

import SwiftUI

import SwiftUI
struct SearchBar: View {
    @Binding var searchText: String
    let onTextChange : ()-> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...",
                      text: $searchText)
                .onChange(of: searchText){_ in
                    onTextChange()
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
/*
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
*/
