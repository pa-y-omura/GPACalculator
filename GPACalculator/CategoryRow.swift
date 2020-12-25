//
//  CategoryRow.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI
import UIKit

struct CategoryRow: View {
    
    @State private var showingActionSheet = false
    @EnvironmentObject var store : Semester //Stores the Class Data
    var items: [Classes] {
        return self.store.getCatList(key: self.key)
    } //NOT UPDATING
    
    var key : Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(items[0].getSemesterName().uppercased())
                .font(.footnote)
                .padding(.leading, 5)
                .padding(.top, 2)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top, spacing: 5){
                    if !self.items.isEmpty {
                        ForEach(items) { indv in
                            
                            VStack{
                            
                                CategoryItem(courseInput: indv).environmentObject(self.store)
                            
                            }
                            
                        /*
                            .contextMenu{
                                VStack{
                                Button(action: {
                                    //guard let index = self.items.firstIndex(of: indv) else { return }
                                    self.Delete(at: self.store.classStorage.firstIndex(where: { $0.id == indv.id })!)})
                                {
                                    Text("Delete")
                                        .foregroundColor(.red)
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                    }
                                }
                            } */
                            
                        }
                    }
                }
             
      
            }
            .frame(height:105)
        }
    }


}



struct CategoryRow_Previews: PreviewProvider {
    
    static var classes = Semester().classStorage
    
    static var previews: some View {
        CategoryRow(key: 2)
    }
}

