//
//  EditItemView.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 09/11/23.
//

import SwiftUI

struct EditItemView: View {
    @EnvironmentObject var listViewModel:ListViewModel
    @Binding var isPresented:Bool
    @Binding var item:ItemModel?
    @State var updatedText:String=""
    var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("Edit Text", text: $updatedText)
                    }

                    Section {
                        Button("Save") {
                            if let item = item, !updatedText.isEmpty {
                                listViewModel.updateItemText(item: item, newText: updatedText)
                                isPresented = false
                            }
                        }.foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                }
                .onAppear {
                    updatedText = item?.title ?? ""
                }
                .navigationTitle("Edit Item")
                .navigationBarItems(trailing: Button("Cancel") {
                    isPresented = false
                })
            }
        }
}

//struct EditItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditItemView()
//    }
//}
