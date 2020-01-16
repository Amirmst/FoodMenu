//
//  Item.swift
//  FoodMenu
//
//  Created by Amir Mostafavi on 1/16/20.
//  Copyright © 2020 amir. All rights reserved.
//

import SwiftUI

struct MenuItem: View {
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(item.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }.padding()
    }
}

#if DEBUG
struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(item: menuData[0])
    }
}
#endif
