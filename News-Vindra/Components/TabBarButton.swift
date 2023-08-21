//
//  TabBarButton.swift
//  News-Vindra
//
//  Created by Samudra Putra on 21/08/23.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.system(size: 16))
            .foregroundColor(isSelected ? .white : Color("text3rd"))
            .padding(.bottom)
            .border(width: isSelected ? 4 : 2, edges: [.bottom], color: isSelected ? .red : Color("text3rd"))
    }
}

//struct TabBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarButton("Syariah")
//    }
//}
