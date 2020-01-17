//
//  ContentView.swift
//  FoodMenu
//
//  Created by Amir Mostafavi on 1/16/20.
//  Copyright © 2020 amir. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    var categories: [String : [Item]] {
        .init(grouping: menuData, by: {$0.category.rawValue})
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    /*
                    ForEach(categories.keys.sorted(), id: \String.self) { category in
                        
                        MenuItemRow(categoryName: "\(category)s", items: self.categories["\(category)"]!)
                            .frame(height: 320)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    */
                    
                    // Workaround to sort the items based
                    // on category priority on the menu
                    MenuItemRow(categoryName: "STARTERS", items: self.categories["starter"]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
                    
                    MenuItemRow(categoryName: "SALADS", items: self.categories["salad"]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
                    
                    MenuItemRow(categoryName: "BURGERS", items: self.categories["burger"]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
                    
                }.navigationBarTitle(Text("Menu")
                    .font(.largeTitle))
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
