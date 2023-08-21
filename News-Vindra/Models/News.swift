//
//  News.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import Foundation

struct News: Identifiable {
    let id = UUID()
    let title: String
    let link: String         // Add link property
    let contentSnippet: String
    let isoDate: String
    let image: NewsImage
}

struct NewsImage: Codable {
    let small: String
    let large: String
}

