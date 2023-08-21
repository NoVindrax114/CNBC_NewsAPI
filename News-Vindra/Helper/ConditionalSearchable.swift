//
//  ConditionalSearchable.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct ConditionalSearchable: ViewModifier {
    let isSearchable: Bool
    @ObservedObject var newsVM: NewsViewModel // Add viewModel parameter

    func body(content: Content) -> some View {
        if isSearchable {
            return AnyView(content.searchable(text: $newsVM.searchText))
        } else {
            return AnyView(content)
        }
    }
}

extension View {
    func conditionalSearchable(isSearchable: Bool, viewModel: NewsViewModel) -> some View {
        self.modifier(ConditionalSearchable(isSearchable: isSearchable, newsVM: viewModel))
    }
}
