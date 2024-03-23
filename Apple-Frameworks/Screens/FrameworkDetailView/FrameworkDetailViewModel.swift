//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 23/03/2024.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    
    // @Binding - Listens from child
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
