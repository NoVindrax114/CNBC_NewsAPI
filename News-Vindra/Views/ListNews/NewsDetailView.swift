//
//  NewsDetailView.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import SwiftUI

struct NewsDetailView: View {
    let news: News
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    AsyncImage(url: URL(string: news.image.large)) { phase in
                        phase.resizable().scaledToFill()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 220)
                    .clipped()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text(news.title)
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .lineLimit(nil)
                            .foregroundColor(Color(.white))
                        
                        Text(news.isoDate.formattedDate())
                            .font(.system(size: 12))
                            .foregroundStyle(.gray)
                        
                        Text(news.contentSnippet)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("text2nd"))
                        
                        Link(destination: URL(string: news.link)!) {
                            HStack {
                                Text("Selengkapnya")
                                    .font(.system(size: 14))
                                Image(systemName: "link")
                            }
                            .frame(width: 156, height: 32)
                            .background(Color("surface2nd"))
                            .mask(RoundedRectangle(cornerRadius: 6))
                        }
                        .offset(x: 200, y: 40)
                    }
                    .padding()
                }
            }
            .background(Color("surface1st"))
        }
        .accentColor(.white)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View  {
        NewsDetailView(news: News(
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
//struct NewsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//            NewsDetailView(news: News(
//title: "This is sample title",
//description: "This is sample description so you can see it in long text",
//image: NewsImage(small: "", medium: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,f_jpg/v1634025439/01h7mjymq414642m0rfxmzeqsh.jpg", large: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_720,f_jpg/v1634025439/01h7qbe45trqdshx0vd4x92y3x.jpg", extraLarge: ""),
//author: "This is author",
//link: "This is link",
//isoDate: "2023-08-13T02:44:58.000Z")
//)

//    }
//}
