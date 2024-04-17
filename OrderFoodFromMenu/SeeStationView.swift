//
//  SeeStationView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 4/8/24.
//

import SwiftUI

struct SeeStationView: View {
    var stationName: String
    @State var isOrderEntreeViewPresent = false
    var breakfastOptions: [String] = ["Steak", "Chicken","White Rice", "Beef Barbacoa", "Pinto Beans"]
    var calories: [String] = ["307", "271" , "147", "206" , "204"]
    
    func clearRectangle() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 200)
            .padding()
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    
                    if( stationName == "Breakfast" || stationName == "Grill"){
                        OrderAheadView()
                            .padding(.top, -30)
                    }
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                        ForEach(0..<breakfastOptions.count, id: \.self){ item in
                            
                            VStack {
                                Image(breakfastOptions[item])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 75, height: 75)
                                    .padding()
                                
                                VStack {
                                    Text(breakfastOptions[item])
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .fontDesign(.serif)
                                    Text(calories[item] + " cal")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                        .fontDesign(.monospaced)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.FoodColor)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black)
                            )
                            .padding([.horizontal, .bottom])
                        }
                    } .padding(.horizontal, 25)
                        .padding(.top)
                    
                }

            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text(stationName)
                        .foregroundStyle(.UABlue)
                        .font(.largeTitle)
                        .blueTitle()
                }

            }
        }


        .sheet(isPresented: $isOrderEntreeViewPresent, content: {
            SeeEntreView()
        })
    }
    
    func OrderAheadView() -> some View{
        Button{
            isOrderEntreeViewPresent = true
        } label:{
            RoundedRectangle(cornerRadius: 25.0)
                .padding()
                .foregroundStyle(.ultraThinMaterial)
                .frame(height: 100)
                .overlay{
                    HStack{
                        Image(stationName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 40)
                        
                        HStack{
                            
                            VStack (alignment: .leading){
                                if(stationName == "Breakfast"){
                                    eggStation()
                                } else{
                                    grillStation()
                                }
                            }
                            
                            Spacer()
                            
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 40, height: 40)
                                .padding([.top, .trailing, .bottom])
                                .overlay {
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .foregroundStyle(.black)
                                        .padding(.trailing, 10)
                                }
                            
                            
                            
                        }
                        .padding(.leading)
                        Spacer()
                        
                    }
                }
        }
    }
    
    func eggStation() -> some View{
        Text("Egg Station")
            .font(.title)
            .foregroundStyle(.black)
            .fontDesign(.serif)
            .bold()
            .multilineTextAlignment(.leading)
            .underline(pattern: .solid, color: .yellow)
    }
    
    func grillStation() -> some View{
        Text("Grill Station")
            .font(.title)
            .foregroundStyle(.black)
            .fontDesign(.serif)
            .bold()
            .multilineTextAlignment(.leading)
            .underline(pattern: .solid, color: .FoodColor)
    }
}

#Preview {
    SeeStationView(stationName: "Breakfast")
}
