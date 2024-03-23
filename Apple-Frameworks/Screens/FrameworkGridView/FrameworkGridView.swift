//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 07/02/2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                                viewModel.isShowingDetailView = true
                            }
                    }
                }
            }
            .navigationTitle("Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                if let selectedFramework = viewModel.selectedFramework {
                    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: selectedFramework, isShowingDetailView: $viewModel.isShowingDetailView))
                }
            }
        }
    }
}


#Preview {
    FrameworkGridView()
}

