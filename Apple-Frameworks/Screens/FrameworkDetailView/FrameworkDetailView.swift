//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 07/02/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    // @Binding - Listens from child
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
           //  XDismissButton(isShowingDetailView: $isShowingDetailView) - Grid View
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
              // AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString)!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
