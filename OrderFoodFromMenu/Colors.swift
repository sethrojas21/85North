//
//  Colors.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/13/24.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    
    static var UABlue: Color{
        Color(red: 0.07421875, green: 0.13671875, blue: 0.5890625)
    }
    
    static var FoodColor: Color{
        Color(red: 0.6171875, green: 0.12890625, blue: 0.15625)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
}

extension Text{
    
    func headerText() -> some View{
        self
            .font(.largeTitle)
            .foregroundStyle(.FoodColor)
            .fontDesign(.monospaced)
    }
    
    func blueTitle() -> some View{
        self                            
            .font(.title)
            .fontDesign(.serif)
            .bold()
            .foregroundStyle(.UABlue)
    }
}

struct BT: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
    }
    
}

struct ExtraShapes{
    
    func clearRoundedRectangle() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 200)
            .padding()
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.move(to: CGPoint(x:  ( 2 * rect.width) / 3 , y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.height))

        return path
    }
}
