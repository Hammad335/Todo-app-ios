//
//  AddView.swift
//  TodoIos
//
//  Created by Hamad on 06/12/2024.
//

import SwiftUI

struct AddView: View {
    // for navigating back programmatically
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""

    @State var isShowAlert = false
    @State var alertText = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type something here...",
                    text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                Button(action: onSaveButtonPressed,
                       label: {
                           Text("Save".uppercased())
                               .frame(height: 50)
                               .frame(maxWidth: .infinity)
                               .background(Color.accentColor)
                               .foregroundColor(.white)
                               .cornerRadius(6)
                               .font(.headline)

                       }).padding(.top)
            }.padding(16)
        }
        .contentMargins(.top, 20)
        .navigationTitle("Add an iten 🖊️")
        .alert(isPresented: $isShowAlert, content: getAlertDialog)
    }

    func getAlertDialog() -> Alert {
        return Alert(title: Text(alertText))
    }

    func onSaveButtonPressed() {
        if textFieldText.count == 0 {
            alertText = "Please enter Todo item text to add into the list 🤝"
            isShowAlert.toggle()
            return
        }
        listViewModel.addNewItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
