//
//  NewsExplore.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct NewsExplore: View {
    
    @StateObject private var newsVM = NewsViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("surface1st").edgesIgnoringSafeArea(.all)
                if newsVM.isLoading {
                    ProgressView("Load News...")
                } else {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Recent News")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                            Text("View more")
                                .font(.system(size: 12))
                                .foregroundColor(Color("text3rd"))
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(newsVM.filteredNews.prefix(50)) { newsItem in
                                    NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                        NewsCardView(news: newsItem)
                                    }
                                }
                            }
                            .lineSpacing(12)
//                            .refreshable {
//                                await newsVM.fetchNews()
//                            }
                        }
                        //                    .searchable(text: $newsVM.searchText)
                        HStack {
                            Text("Recommended")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text("View more")
                                .font(.system(size: 12))
                                .foregroundColor(Color("text3rd"))
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(newsVM.filteredNews.suffix(50)) { newsItem in
                                    NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                        NewsCardView(news: newsItem)
                                    }
                                }
                            }
                            .lineSpacing(12)
                        }
                        .navigationBarTitle(" ")
                        //                    .searchable(text: $newsVM.searchText)
                        
                    }
                    .padding()
                    .lineSpacing(4)
                    .searchable(text: $newsVM.searchText)
                    .refreshable {
                        await newsVM.fetchNews()
                    }
                    
                }
            }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
}

struct NewsExplore_Previews: PreviewProvider {
    static var previews: some View {
        NewsExplore()
    }
}
