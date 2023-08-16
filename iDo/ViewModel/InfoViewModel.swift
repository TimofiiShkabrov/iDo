//
//  InfoViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 16.08.2023.
//

import Foundation

class InfoViewModel: ObservableObject {
    
    @Published var indexInfo = 0
    @Published var infoShow = false
    
    init() {}
    
}
