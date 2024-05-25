@_private(sourceFile: "RuleBookView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI
import PDFKit

extension PDFKitView {
    @_dynamicReplacement(for: updateUIView(_:context:)) private func __preview__updateUIView(_ pdfView: PDFView, context: Context) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/RuleBookView.swift", line: 35)
        pdfView.document = PDFDocument(url: url)
    
#sourceLocation()
    }
}

extension PDFKitView {
    @_dynamicReplacement(for: makeUIView(context:)) private func __preview__makeUIView(context: Context) -> PDFView {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/RuleBookView.swift", line: 28)
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = __designTimeBoolean("#5361.[3].[2].[2].[0]", fallback: true)
        return pdfView
    
#sourceLocation()
    }
}

extension RuleBookView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/RuleBookView.swift", line: 15)
        PDFKitView(url)
            .edgesIgnoringSafeArea(.all)
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.RuleBookView
import struct ROLOSOFT_FRONT.PDFKitView
#Preview {
    // Provide a mock URL for preview purposes
    RuleBookView(url: URL(fileURLWithPath: "reglamento_frisa.pdf"))
}



