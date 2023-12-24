//
//  Product.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 4/12/2566 BE.
//

import SwiftUI


// Product Model
struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: [ProductType]
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// Product Types
enum ProductType: String,CaseIterable{
    case All = "All"
    case Arttoy = "Art toys"
    case Doll = "Dolls"
    case Figure = "Figures"
}


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
