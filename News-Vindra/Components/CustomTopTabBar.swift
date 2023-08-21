//
//  CustomTopBar.swift
//  News-Vindra
//
//  Created by Samudra Putra on 21/08/23.
//

import SwiftUI

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            TabBarButton(text: "Common", isSelected: .constant(tabIndex == 0))
                .onTapGesture {
                    onButtonTapped(index: 0)
                }
            Spacer()
            TabBarButton(text: "Entrepreneur", isSelected: .constant(tabIndex == 1))
                .onTapGesture {
                    onButtonTapped(index: 1)
                }
            Spacer()
            TabBarButton(text: "Syariah", isSelected: .constant(tabIndex == 2))
                .onTapGesture {
                    onButtonTapped(index: 2)
                }
            Spacer()
        }
        .border(width: 2, edges: [.bottom], color: Color("text3rd"))
    }
    private func showView() {
        if tabIndex == 0 {
            NewsListView()
        }
        else if tabIndex == 1 {
            EntrepreneurNewsListView()
        } else if tabIndex == 2 {
            SyariahNewsListView()
        }
    }
    private func onButtonTapped(index: Int) {
        withAnimation {
            tabIndex = index
            
        }
    }
}

//struct CustomTopBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTopTabBar()
//    }
//}
