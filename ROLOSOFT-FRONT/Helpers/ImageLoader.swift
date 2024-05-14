//
//  ImageLoader.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/05/24.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var imageData = Data()
    
    func loadImage(fromURL urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}
