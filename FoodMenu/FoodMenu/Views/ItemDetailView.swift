//
//  ItemDetailView.swift
//  FoodMenu
//
//  Created by Amir Mostafavi on 1/16/20.
//  Copyright © 2020 amir. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    @State var ordered: Bool = false
    var item: Item
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    Image(item.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                    
                    ItemNameOverlay(itemName: item.name, ordered: ordered)
                }.listRowInsets(EdgeInsets())
                
                VStack(alignment: .leading) {
                    Text(item.description)
                        .foregroundColor(.primary)
                        .font(.body)
                        .lineLimit(nil)
                        .lineSpacing(12)
                        .padding(.top, 10)
                        .padding(.leading)
                    
                    HStack {
                        Spacer()
                        Button(action: {self.ordered.toggle()}) {
                            ItemButtonLabel(ordered: ordered)
                        }
                        Spacer()
                    }
                }
                
            }
        }.edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
    }
}

struct ItemNameOverlay: View {
    var itemName: String
    var ordered: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 80)
                .opacity(0.25)
                .blur(radius: 10)
            
            HStack {
                Text(itemName)
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round))
                    .frame(width: 100, height: 30)
                    .overlay(Text("Ordered").foregroundColor(.white).bold())
                    .opacity(ordered ? 1 : 0)
                    .animation(.default)
                    .padding(.bottom, -5)
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct ItemButtonLabel: View {
    var ordered: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
        .foregroundColor(ordered ? .red : .blue)
        .animation(.default)
        .overlay(Text(ordered ? "Cancel Order" : "Order Now")
            .frame(width: 150)
            .animation(nil)
            .font(.headline)
            .foregroundColor(.white))
        .frame(width: 200, height: 50, alignment: .center)
        .padding(.top, 50)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: menuData.first!)
    }
}
