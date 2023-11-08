//
//  ListRowViewModel.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import Foundation

class ListViewModel:ObservableObject{
    @Published var items:[ItemModel]=[]{
        didSet{
            saveItems()
        }
    }
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data=UserDefaults.standard.data(forKey: "items_key"),
            let savedItems=try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items=savedItems
    }
    
    func deleteItems(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from:IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        items.append(ItemModel(title: title, isCompleted: false))
        
        //If int is used for id instead of uuid
        // Generate a unique ID for the new item
//               let newID = items.isEmpty ? 0 : items.map { $0.id }.max()! + 1
//               var newItem = item
//               newItem.id = newID
    }
    
    func toggleCompletion(item:ItemModel){
        
//        if let index=items.firstIndex(where: { existingItem in
//            item.id==existingItem.id
//        }){
//             items[index]=item.updateCompletion()
//        }
        
        if let index=items.firstIndex(where: {$0.id==item.id}){
            //items[index]=item.updateCompletion()
            items[index].isCompleted.toggle()
        }
    }
    
    // Update the text of an item
       func updateItemText(item: ItemModel, newText: String) {
           if let index = items.firstIndex(where: { $0.id == item.id }) {
               items[index].title = newText
           }
       }

    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "items_key")
        }
    }
}
