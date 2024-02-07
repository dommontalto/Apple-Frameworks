//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 07/02/2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // @StateObject - Listens still but object version
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)) {
                        
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            
            .navigationTitle("Frameworks")
        }
        
        .accentColor(Color(.label)) // Remove for Grid View
    }
}

#Preview {
    FrameworkGridView()
}

// Grid view

/*
struct FrameworkGridView: View {
    
    // @StateObject - Listens still but object version
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                FrameworkDetailView(framework:
                                        viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
    }
}

*/
