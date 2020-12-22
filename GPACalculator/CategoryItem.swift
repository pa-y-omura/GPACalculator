//
//  CategoryItem.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    
    var course: Classes
    @State private var showingEditSheet = false
    @State private var showingActionSheet = false
    @EnvironmentObject var store : Semester //Stores the Class Data
    var index : Int { store.classStorage.firstIndex(where: { $0.id == course.id })! }
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(course.getPrimColour()), Color(course.getSecColour())]), startPoint: .bottomLeading, endPoint: .topTrailing)
            
            VStack {
                HStack{
                    
                    Text(course.grade)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    
               
                  Spacer()
                    
                }
                
                HStack{
                    Text(course.class_name)
                          .font(.system(size: 16, weight: .semibold, design: .rounded))
                          .foregroundColor(.white)
                          .padding(.leading, 10)
                    Spacer()
                    
                  }
                
                HStack{
                    Text(course.outputCreditHours() + " Credits")
                        .font(.system(size: 10, weight: .regular, design: .rounded))
                          .foregroundColor(.white)
                          .padding(.leading, 10)
                    Spacer()
                    
                      
                  }
            }
            
        }
    .frame(width: 120, height: 100)
    .cornerRadius(15)
    .onTapGesture {
            self.showingActionSheet = true
        
        for i in self.store.classStorage{
                        print(i.class_name)
                        
                    }
                    
                    print("Class Name is : ", self.course.class_name)
                   
            
        }
        .actionSheet(isPresented: $showingActionSheet){
            ActionSheet(title: Text("Choose Option"), buttons: [
            
                .default(Text("Edit"), action: {
                     
                    
    
                    self.showingEditSheet.toggle()
                    
                }),
                
                .destructive(Text("Delete"), action: {
                    
                     self.Delete(at: self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!)
                    
                }),
                
                .cancel()
            
            
            ])
        } .sheet(isPresented: $showingEditSheet){
            EditClassUIView(course: self.course).environmentObject(self.store)
        }
        
        
        
        
        
    /*
    .contextMenu{
           VStack{
            
            Button(action: {
                
                
                let index = self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!
                
                self.store.classStorage[index].editClass(class_name: "CHEM 103", grade: "A", credit_hours: 4.0, category: Classes.Category.Fall2018, colour: 5)
                
            }
            ){Text("Test Button")}
            
            Button(action: {self.showingEditSheet.toggle()
                
                for i in self.store.classStorage{
                    print(i.class_name)
                    
                }
                
                print("Class Name is : ", self.course.class_name)
                
            }){
                HStack{
                    Text("Edit")
                    Image(systemName: "pencil")
                }
                
            }
            .sheet(isPresented: $showingEditSheet){
                EditClassUIView(course: self.course).environmentObject(self.store)
               
            }
            
            

            
            
           Button(action: {
               //guard let index = self.items.firstIndex(of: indv) else { return }
            self.Delete(at: self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!)})
           {
            HStack{
               Text("Delete")
                   .foregroundColor(.red)
               Image(systemName: "trash")
                   .foregroundColor(.red)
            }
               }
                    
           }
       }
 */

    }
    
    
    func Delete(at index: Int) {
        store.classStorage.remove(at: index)
    }
    
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(course: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0))
    }
}
