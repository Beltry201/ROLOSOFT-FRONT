//
//  RuleBookView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/05/24.
//

import SwiftUI
import PDFKit

struct RuleBookView: View {
    let url: URL
    
    var body: some View {
        PDFKitView(url)
            .edgesIgnoringSafeArea(.all)
    }
}

struct PDFKitView: UIViewRepresentable {
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = PDFDocument(url: url)
    }
}

#Preview {
    // Provide a mock URL for preview purposes
    RuleBookView(url: URL(fileURLWithPath: "reglamento_frisa.pdf"))
}

