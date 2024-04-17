//
//  About85NorthView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 4/11/24.
//

import SwiftUI

struct About85NorthView: View {
    var body: some View {
        VStack{
            Image("85north")
                .resizable()
                .scaledToFit()
                .blur(radius: 2.0)
                .padding(.top)
                .overlay{
                    VStack{
                        Text("Welcome to")
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                            .blueTitle()
                            .padding(.top)
                            .padding(.bottom, -30)
                        HStack{
                            Image("UALogo")
                                .resizable()
                                .scaledToFit()
                                .padding(30)
                            Image("85logo")
                                .resizable()
                                .scaledToFit()
                        }

                    }
                }
            
            Schedule()
            
            Location()
        }
    }
    
    func Schedule() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 125)
            .padding()
            .overlay{
                VStack{
                    Text("Schedule")
                        .bold()
                        .font(.title)
                        .fontDesign(.serif)
                        .foregroundStyle(.UABlue)
                    Text("Mon - Fri: 6:00 - 8:00")
                        .underline()
                    Text("Sat - Sun: 9:00 - 8:00")
                        .underline()
                }
            }
    }
    
    func Location() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 125)
            .padding()
            .overlay{
                VStack{
                    Text("Address")
                        .blueTitle()
                    Text("1103 E Mabel St, Tucson, AZ 85719")
                        .underline()
                }
            }
    }
    
    func AboutUsBlurb() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .padding()
            .frame(height: 200)
            .overlay{
                VStack{
                    Image("UALogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                    Text("Located in the heart of the Honors College")
                        .foregroundStyle(.FoodColor)
                        .blueTitle()
                        .multilineTextAlignment(.center)
                        
                }
            }
    }
}

#Preview {
    About85NorthView()
}
