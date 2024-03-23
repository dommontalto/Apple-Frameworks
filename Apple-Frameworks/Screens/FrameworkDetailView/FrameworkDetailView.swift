//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 07/02/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            
            XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue) 
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.urlString) ?? /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                AFButton(title: "Learn More")
            })
            
//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
//              AFButton(title: "Learn More")
//                Label("Learn More", systemImage: "book.fill")
//            }
            
        }
//        .fullScreenCover(isPresented: $viewModel.isShowingSafariView, content: {
//            SafariView(url: URL(string: viewModel.framework.urlString)!)
//        })
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
}
