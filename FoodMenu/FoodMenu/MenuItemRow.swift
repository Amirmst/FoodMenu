//
//  MenuItemRow.swift
//  FoodMenu
//
//  Created by Amir Mostafavi on 1/16/20.
//  Copyright © 2020 amir. All rights reserved.
//

import SwiftUI

struct MenuItemRow: View {
    var categoryName: String
    var items: [Item]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(categoryName)
                .font(.title)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(self.items, id: \.id) { item in
                        MenuItem(item: item)
                            .frame(width: 300)
                            .padding(.trailing, 30)
                    }
                }
            }
        }
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(categoryName: "STARTERS", items: menuData)
    }
}
