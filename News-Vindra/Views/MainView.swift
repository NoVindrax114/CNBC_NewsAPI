//
//  MainView.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TabBarTop()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
                .tag(0)
            NewsExplore()
                .tabItem {
                    Image(systemName: "safari")
                    Text("Explore")
                }
        }
        .onAppear() {
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().barTintColor = UIColor(Color("tabBar"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View  {
        MainView()
    }
}

// Uncomment this code for Xcode 14 below
// Xcode 14
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
