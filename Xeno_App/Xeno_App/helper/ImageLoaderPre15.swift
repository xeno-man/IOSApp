//
//  ImageLoaderPre15.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 05/01/2022.
//

import Foundation
import Combine
import SwiftUI
// van stack overflow
// https://stackoverflow.com/questions/60677622/how-to-display-image-from-a-url-in-swiftui
class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
