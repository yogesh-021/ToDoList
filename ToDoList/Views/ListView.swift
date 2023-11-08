//
//  ListView.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel:ListViewModel
    @State private var isEditItemSheetPresented = false
    @State private var selectedItemForEdit: ItemModel?
    
    var body: some View {
            ZStack{
                if listViewModel.items.isEmpty{
                    Text("No items")
                }
                else{
                    List{
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    selectedItemForEdit = item
                                    isEditItemSheetPresented = true
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItems)
                        .onMove(perform: listViewModel.moveItems)
                    }
                }
            }
            .navigationTitle("Todo List")
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing: (
                                    NavigationLink("Add", destination: AddView())
                    )
            ).sheet(isPresented: $isEditItemSheetPresented) {
            EditItemView(isPresented: $isEditItemSheetPresented, item: $selectedItemForEdit)
                .environmentObject(listViewModel)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
