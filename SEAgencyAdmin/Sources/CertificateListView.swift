// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - CertificateListView

/// Displays all certificates in a grid.
public struct CertificateListView: View {
    @State private var certificates: [Certificate]
    @State private var selected: Certificate?

    public init(certificates: [Certificate] = AgencyDemoData.certificates) {
        _certificates = State(initialValue: certificates)
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Spacing.md) {
                ForEach(certificates) { cert in
                    CertificateCardView(certificate: cert)
                        .onTapGesture { selected = cert }
                }
            }
            .padding(Spacing.md)
        }
        .navigationTitle("Zertifikate")
        .sheet(item: $selected) { cert in
            NavigationStack { CertificateDetailView(certificate: cert) }
        }
    }
}

private struct CertificateCardView: View {
    var certificate: Certificate

    var body: some View {
        VStack(spacing: Spacing.sm) {
            Image(systemName: "doc.richtext")
                .font(.largeTitle)
            Text(certificate.issuedAt, style: .date)
                .font(AppFont.caption())
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.primary400))
        .foregroundColor(.white)
        .accessibilityLabel("Zertifikat am \(certificate.issuedAt.formatted())")
        .onTapGesture { }
    }
}

private struct CertificateDetailView: View {
    var certificate: Certificate
    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) var openURL

    var body: some View {
        VStack(spacing: Spacing.md) {
            Button("PDF öffnen") { openURL(certificate.pdfURL) }
            Button("Teilen") {}
        }
        .navigationTitle("Zertifikat")
        .toolbar { Button("Schließen") { dismiss() } }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { CertificateListView() }
}
#endif
