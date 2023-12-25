//
//  SharedDataModel.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 25/12/2566 BE.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    // Detail Product Data
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    // Matched Geometry Effect from Search page
    @Published var fromSearchPage: Bool = false
}
