import SwiftUI

struct AddView: View {
    
    @State var textFieldText : String = ""
    
    let myGray = Color(#colorLiteral(red: 0.9403803662, green: 0.9403803662, blue: 0.9403803662, alpha: 1))
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type seomthing hre...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(myGray)
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                )
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
