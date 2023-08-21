//
//  NewsViewModel.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var selectedCategory: String? = nil
    
    // Fetch News Categories
//    var uniqueCategories: [String] {
//        Set(news.flatMap { $0.categories }).sorted()
//    }
    
    // Search function
//    var filteredNews: [News] {
//        if searchText.isEmpty {
//            return news
//        } else {
//            return news.filter { news in
//                news.title.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
    
    var filteredNews: [News] {
        if !searchText.isEmpty {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            return news
        }
    }

    
    func fetchNews() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/cnbc-news/")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchEntrepreneurNews() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/cnbc-news/entrepreneur")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchSyariahNews() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/cnbc-news/syariah")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
}
