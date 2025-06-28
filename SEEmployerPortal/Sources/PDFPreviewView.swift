// swiftlint:disable all
import SwiftUI
import PDFKit
import DesignSystem

// MARK: - PDFPreviewView

/// Simple PDF viewer using PDFKit.
public struct PDFPreviewView: UIViewRepresentable {
    var url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = PDFDocument(url: url)
        return pdfView
    }

    public func updateUIView(_ uiView: PDFView, context: Context) {}
}

// MARK: - Preview
#if DEBUG
#Preview {
    PDFPreviewView(url: EmployerDemoData.docs[0].fileURL)
}
#endif
