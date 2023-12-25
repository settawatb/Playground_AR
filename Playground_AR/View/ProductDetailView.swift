//
//  ProductDetailView.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 25/12/2566 BE.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    // Matched Geometry Effect
    var animation:Namespace.ID
    
    // Shared Data Model
    @EnvironmentObject var sharedData: SharedDataModel
    var body: some View {
        
        VStack{
            
            // Title Bar and Product Image
            VStack{
                
                // Title Bar
                HStack{
                    Button {
                        // Closeing View
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("Favorite")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
                .padding()
                
                // Product Image
                // Add Matched Geometry Effect
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                    .cornerRadius(50)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
                    
                
            }
            .frame(height: getRect().height / 2.7)
            .zIndex(1)
            
            // product Details
            ScrollView(.vertical, showsIndicators: false) {
                
                // Product Data
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(product.title)
                        .font(.custom(customFont, size: 20).bold())
                    
                    Text(product.subtitle)
                        .font(.custom(customFont, size: 18))
                        .foregroundStyle(Color.gray)
                    
                    //Text(product.description)
                    Text("Description of product example")
                        .font(.custom(customFont, size: 16))
                        .foregroundStyle(Color.gray)
                    
                    Button {
                        
                        // Since image at right
                        
                    } label: {
                        
                        Label {
                            Image(systemName: "arrow.right")
                        } icon: {
                            Text("Full Description")
                        }
                        .font(.custom(customFont, size: 15).bold())
                        .foregroundColor(PurPle)
                    }
                    HStack{
                        
                        Text("Total")
                            .font(.custom(customFont, size: 17))
                        Spacer()
                        Text("\(product.price) THB")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(PurPle)
                    }
                    .padding(.vertical, 20)
                    
                    // Add button
                    Button {
                        
                    } label : {
                        Text("Add to cart")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(Color.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background (
                                
                                Color(PurPle)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.06), radius: 5, x:5, y:5)
                            )
                    }
                }
                .padding([.horizontal,.bottom], 25)
                .padding(.top, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            // Corner Radius topside
            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
            .ignoresSafeArea()
        }
        .zIndex(0)
        .background(LightGray.ignoresSafeArea())
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample Product for Building Preview
//        ProductDetailView(product: HomeViewModel().products[0])
//            .environmentObject(SharedDataModel())
        MainPage()
    }
}
