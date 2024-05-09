//
//  LoadingView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 29/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView() // Display a system progress view
                .progressViewStyle(CircularProgressViewStyle()) // Customize the progress view style
                .padding()
            
            Text("Loading...") // Display a loading text
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.8)) // Semi-transparent white background
    }
}

#Preview {
    LoadingView()
}
