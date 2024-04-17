//
//  FoodDetailView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 4/10/24.
//

import SwiftUI

struct Icon: View, Identifiable {
    var id = UUID()
    @State var isClicked: Bool = false
    @State var name = "Gilbert"
    
    var body: some View {
        Button(name){
            isClicked.toggle()
            if(isClicked){
                name = "John"
            } else{
                name = "Gilbert"
            }
        }
    }
}

struct FoodDetailView: View {
    @State var arr = Array(repeating: Icon(), count: 5)
    @State var selectedFoodIndex: Int? = nil
    var foods = ["Steak", "Chicken"]
    
    var body: some View {
        VStack {
            ForEach(0..<foods.count) { index in
                RadioButton(name: foods[index], isSelected: selectedFoodIndex == index) {
                    selectedFoodIndex = index
                }
            }
            
            if let selectedFoodIndex = selectedFoodIndex {
                Text("Selected food: \(foods[selectedFoodIndex])")
            } else {
                Text("No food selected")
            }
        }
    }
}

struct RadioButton: View {
    var name: String
    var isSelected: Bool
    var action: () -> Void
    
    func unfilledFoodIcon() -> some View {
        Circle()
            .stroke(.black, lineWidth: 1.0)
            .frame(width: 60, height: 60)
    }
    
    func filledFoodIcon() -> some View {
        Circle()
            .stroke(.black, lineWidth: 1.0)
            .frame(width: 60, height: 60)
            .background {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue) // Change this to your desired filled color
            }
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                ZStack {
                    if isSelected {
                        filledFoodIcon()
                    } else {
                        unfilledFoodIcon()
                    }
                    
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                Text(name)
            }
            .padding()
        }
    }
}


#Preview {
    FoodDetailView()
}
