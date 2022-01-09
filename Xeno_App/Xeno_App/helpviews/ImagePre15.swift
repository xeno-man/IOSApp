//
//  ImagePre15.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 05/01/2022.
//
import SwiftUI
// van stackoverflow
// https://stackoverflow.com/questions/60677622/how-to-display-image-from-a-url-in-swiftui
struct ImageViewPre15: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
