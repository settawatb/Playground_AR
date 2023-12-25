//
//  OnBoardingPage.swift
//  Playground_AR
//
//  Created by Settawat Buddhakanchana on 18/11/2566 BE.
//

import SwiftUI

let customFont = "GeneralSans-VariableItalic"
let PurPle = Color(red: 125/255, green: 122/255, blue: 255/255)
let LightGray = Color(red: 230 / 255, green: 228 / 255, blue: 230 / 255)

struct OnBoardingPage: View {
    // Showing Login Page
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            
            Image("Onboard1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
                
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1),
                            radius: 5,x: 5, y: 5)
                    .foregroundColor(.white)
            }
            .padding(.horizontal,15)
            // Adding Some Adjustments only for larger displays
            .offset(y: getReact().height < 750 ? 20 : 40)
            
            Spacer()
            
        }
        .padding()
        .padding(.top,getReact().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.white)
        )
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        
        )
    }
}

#Preview {
    OnBoardingPage()
}

// Extending View to get Screen Bounds
extension View{
    func getReact()->CGRect{
        return UIScreen.main.bounds
    }
}
