//
//  NewsCardView.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct NewsCardView: View {
    let news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: URL(string: news.image.small)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 166, height: 104)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal)
            
            Text(news.title)
                .font(.system(size: 16, design: .rounded))
                .fontWeight(.semibold)
                .truncationMode(.tail)
                .foregroundColor(Color("icon2nd"))
                .lineLimit(3)
                .lineSpacing(0)
                .padding(.leading)
            
            Text(news.isoDate.formattedDateShort())
                .font(.footnote)
                .foregroundStyle(Color("text3rd"))
                .padding(.leading)
            
        }
        .padding(.all)
        .frame(width: 182, height: 230)
        .background(Color("surface2nd"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News(
            title: "Rupiah Gak Buruk Banget di Asia, Berkat Jokowi Effect?",
            link: "https://www.cnbcindonesia.com/market/20230819102731-17-464285/rupiah-gak-buruk-banget-di-asia-berkat-jokowi-effect",
            contentSnippet: "Rupiah pada pekan ini kembali mencatatkan kinerja yang kurang menggembirakan. Namun, rupiah masih lebih baik dari beberapa mata uang asia lainnya.",
            isoDate: "2023-08-19T06:15:07.000Z", image: NewsImage(
                small: "https://awsimages.detik.net.id/visual/2020/06/08/ilustrasi-rupiah-dan-dolar-cnbc-indonesiaandrean-kristianto-4_169.jpeg?w=1200&q=90",
                large: "https://awsimages.detik.net.id/visual/2020/06/08/ilustrasi-rupiah-dan-dolar-cnbc-indonesiaandrean-kristianto-4_169.jpeg?w=1200&q=100"
            )
        ))
    }
}
