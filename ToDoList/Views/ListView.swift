//
//  ListView.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel:ListViewModel
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
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItems)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        }
        .navigationTitle("Todo List")
        .listStyle(PlainListStyle())
        .navigationBarItems(leading: EditButton(),
                            trailing: (
                                NavigationLink("Add", destination: AddView())
                )
        )
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
