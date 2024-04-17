//
//  OrderView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/12/24.
//

import SwiftUI

struct SeeEntreView: View {
    var entreeOptions = ["Burrito", "Bowl", "Quesadilla"]
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    Text("Choose Your")
                    Text("Entree")
                        .foregroundStyle(.FoodColor)
                }
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .fontDesign(.serif)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height: 1)
                    .padding(.horizontal)
                    .foregroundStyle(.UABlue)
                
                ScrollView{
                    LazyVStack (alignment: .leading){
                        ForEach(entreeOptions, id: \.self){ entree in
                            HStack{
                                NavigationLink(destination: CreateEntreeView(entreeString: entree)) {
                                    Image(entree)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 150)
                                    
                                    Text(entree)
                                        .fontDesign(.serif)
                                        .font(.system(size: 22.5))
                                        .foregroundStyle(.FoodColor)
                                        .bold()
                                }
                            }
                            .padding(5)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    SeeEntreView()
}
