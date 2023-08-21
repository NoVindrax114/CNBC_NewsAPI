//
//  NewsListEntrepreneur.swift
//  News-Vindra
//
//  Created by Samudra Putra on 21/08/23.
//

import SwiftUI

struct EntrepreneurNewsListView: View {
    @State var tabIndex = 0
    @StateObject private var newsVM = NewsViewModel()

    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("surface1st").edgesIgnoringSafeArea(.all)
                if newsVM.isLoading {
                    ProgressView("Load News...")
                } else {
                    VStack {
                        VStack {
                            TabView {
                                ForEach(newsVM.news.prefix(4)) { newsItem in
                                    NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                        NewsJumboView(news: newsItem)
                                    }
                                }
                            }
                            .tabViewStyle(.page)
                            
                            HStack {
                                Text("Top Stories")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("See all")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("text3rd"))
                            }
                            ScrollView {
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(newsVM.news.suffix(96)) { newsItem in
                                        NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                            NewsRowView(news: newsItem)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .refreshable {
                            await newsVM.fetchEntrepreneurNews()
                        }
                    }
                }
            }
        }
        .task {
            await newsVM.fetchEntrepreneurNews()
        }
    }
}

struct EntrepreneurNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        EntrepreneurNewsListView()
    }
}
