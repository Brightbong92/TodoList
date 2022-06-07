import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    let myGray = Color(#colorLiteral(red: 0.9403803662, green: 0.9403803662, blue: 0.9403803662, alpha: 1))
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("할일을 적어주세요..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(myGray)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed
                , label: {
                    Text("저장".uppercased())
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("할일 추가 ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate () -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "최소 3글자 이상을 입력해주세요. 😵😥"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert () -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
