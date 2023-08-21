//
//  NewsJumboView.swift
//  News-Vindra
//
//  Created by Samudra Putra on 20/08/23.
//

import SwiftUI

struct NewsJumboView: View {
    let news: News
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
                AsyncImage(url: URL(string: news.image.large)) { image in
                    VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
                //                            .padding(/*@START_MENU_TOKEN@*/.horizontal)
            
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(news.isoDate.formattedDateShort())
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 100)
                
                Text(news.title)
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(.semibold)
                    .truncationMode(.tail)
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .lineSpacing(0)
                    .shadow(color: .black, radius: 100)
                    .multilineTextAlignment(.leading)

                //                    .padding([.bottom, .leading])
            }
            .padding([.bottom, .leading])
        }
        .listRowSeparator(.hidden)
        
    }
}

struct NewsJumboView_Previews: PreviewProvider {
    static var previews: some View {
        NewsJumboView(news: News(
            title: "Rupiah Gak Buruk Banget di Asia, Berkat Jokowi Effect?",
            link: "https://www.cnbcindonesia.com/market/20230819102731-17-464285/rupiah-gak-buruk-banget-di-asia-berkat-jokowi-effect",
            contentSnippet: "Rupiah pada pekan ini kembali mencatatkan kinerja yang kurang menggembirakan. Namun, rupiah masih lebih baik dari beberapa mata uang asia lainnya.",
            isoDate: "2023-08-19T06:15:07.000Z",
            image: NewsImage(
                small: "https://awsimages.detik.net.id/visual/2020/06/08/ilustrasi-rupiah-dan-dolar-cnbc-indonesiaandrean-kristianto-4_169.jpeg?w=1200&q=90",
                large: "https://awsimages.detik.net.id/visual/2020/06/08/ilustrasi-rupiah-dan-dolar-cnbc-indonesiaandrean-kristianto-4_169.jpeg?w=1200&q=100"
            )
        ))
    }
}
