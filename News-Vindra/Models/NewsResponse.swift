//
//  NewsResponse.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import Foundation

struct NewsResponse: Codable {
    let data: [NewsData]
}

struct NewsData: Codable {
    let title: String
    let link: String         // Add link property
    let contentSnippet: String
    let isoDate: String
    let image: NewsImage
}

