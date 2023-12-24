//
//  MainPage.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 4/12/2566 BE.
//

import SwiftUI

struct MainPage: View {
    // Current Tab
    @State var currentTab: Tab = .Home
    
    //Hiding Tab Bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            // Tab View
            TabView(selection: $currentTab) {
                Home()
                    .tag(Tab.Home)
                Text("Favorite")
                    .tag(Tab.Favorite)
                Text("Profile")
                    .tag(Tab.Profile)
                Text("Cart")
                    .tag(Tab.Cart)
            }
            
            //Custom Tab Bar
            HStack(spacing :0){
                ForEach(Tab.allCases,id: \.self){tab in
                    Button {
                        //updating tab
                        currentTab = tab
                    } label: {
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            // Background Tab icon
                            .background(
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                    // blur
                                    .blur(radius:5)
                                    // size icon big
                                    .padding(-7)
                                    .opacity(currentTab == tab ?
                                             1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ?
                                             Color(red: 125/255, green: 122/255, blue: 255/255):Color.black.opacity(0.35))
                    }
                }
            }
            .padding([.horizontal,.bottom,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}


// Case Interatable
//Tab Basses
enum Tab: String,CaseIterable {
    
    //Image in asset
    case Home = "Home"
    case Favorite = "Favorite"
    case Profile = "Profile"
    case Cart = "Cart"
}


#Preview {
    MainPage()
}
