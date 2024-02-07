//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Dominic Montalto on 07/02/2024.
//

import SwiftUI

// ObservableObject - Can now broadcast changes
final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    // @Published - Broadcast changes
    @Published var isShowingDetailView = false
    
}
