//
//  AddView.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var testFieldText:String=""
    
    @State var alertTitle:String=""
    @State var showAlert:Bool=false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Add item", text: $testFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(cgColor: CGColor(red: 0.45, green: 0.5, blue: 0.6, alpha: 0.2)))
                    
                
                
                Button(action: saveButtonPressed, label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(10)
            
        }
        .navigationTitle("Add Item")
        .alert(isPresented: $showAlert, content: getAlert)
       
    }
    
    func saveButtonPressed(){
        if checkText(){
            listViewModel.addItem(title: testFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func checkText()->Bool{
        if testFieldText.count<3{
            alertTitle="Enter atlest 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()->Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        
    }
}
