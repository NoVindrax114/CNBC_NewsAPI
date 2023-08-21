//
//  TabBarTop.swift
//  News-Vindra
//
//  Created by Samudra Putra on 20/08/23.
//

import SwiftUI

struct TabBarTop: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                Image(systemName: "bell")
                    .foregroundColor(.white)
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.white)
            }
            .padding([.horizontal, .bottom])
            
            CustomTopTabBar(tabIndex: $tabIndex)
            if tabIndex == 0 {
                NewsListView()
            }
            else if tabIndex == 1 {
                EntrepreneurNewsListView()
            } else if tabIndex == 2 {
                SyariahNewsListView()
            }
        }
        .frame(minHeight: 60)
        .background(Color("surface3rd"))
    }
}

struct TabBarTop_Previews: PreviewProvider {
    static var previews: some View {
        TabBarTop()
    }
}
