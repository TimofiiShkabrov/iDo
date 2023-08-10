//
//  MenuViewModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 10.08.2023.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    @Published var showTasksListView = true
    @Published var showProfileView = false
    
    init() {}
}
