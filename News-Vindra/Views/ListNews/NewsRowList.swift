//
//  NewsRowList.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct NewsRowView: View {
    let news: News
    
    var body: some View {
        ZStack {
            Color("surface2nd").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center, spacing: 14) {
                    AsyncImage(url: URL(string: news.image.small)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 62)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                    .padding([.top, .leading])
                    
                    VStack(spacing: 8) {
                        Text(news.title)
                            .font(.system(size: 16, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(5)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("icon2nd"))
                            .padding(.top)
                            
                    }
                }
                
                Text(news.isoDate.formattedDateShort())
                    .font(.system(size: 10))
                    .foregroundStyle(Color("text3rd"))
                    .multilineTextAlignment(.leading)
                    .padding([.bottom, .leading])
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View  {
        NewsRowView(news: News(
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
// Uncomment this code for Xcode 14 below
// Xcode 14
//struct NewsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRowView(news: News(
//title: "This is sample title",
//description: "This is sample description so you can see it in long text",
//image: NewsImage(small: "", medium: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,f_jpg/v1634025439/01h7mjymq414642m0rfxmzeqsh.jpg", large: "", extraLarge: ""),
//author: "This is author",
//link: "This is link",
//isoDate: "2023-08-13T02:44:58.000Z")
//)
//    }
//}
