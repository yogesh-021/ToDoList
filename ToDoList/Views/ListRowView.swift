//
//  ListRowView.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel:ListViewModel
    let item:ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(item.isCompleted ? Color.green:Color.red)
                .onTapGesture {
                    listViewModel.toggleCompletion(item: item)
                }
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title:"hi", isCompleted: false))
    }
}
