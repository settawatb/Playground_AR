//
//  StaggeredGrid.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 24/12/2566 BE.
//

import SwiftUI

// Custom View Builder

struct StaggeredGrid<Content: View, T: Identifiable>: View
where T: Hashable {
    
    var content: (T) -> Content
    var list: [T]
    
    // Columns...
    var columns: Int
    
    // Properties
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    // Staggered Grid Function
    func setUpList() -> [[T]] {
        
        // creating empty sub arrays of column count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // spiliting array for VStack oriented View
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            // increasing index count
            // and resetting if over bounds the columns count
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top, spacing: 20) {
                
                ForEach(setUpList(),id: \.self){ columnsData in
                    
                    // For Optimized LazyStack
                    LazyVStack(spacing: spacing){
                        
                        ForEach(columnsData) {object in
                            content(object)
                        }
                    }
                }
            }
            
            // vertical padding
            // horizontal padding
            .padding(.vertical)
        }
    }
}

    
    struct StaggeredGrid_Previews: 
        PreviewProvider {
        static var previews: some View {
            Home()
    }
}
