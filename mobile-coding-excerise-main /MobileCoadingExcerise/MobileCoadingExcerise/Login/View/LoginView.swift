

import SwiftUI

struct LoginView: View {
    
    @State var email: String
    @State var password: String
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                
               Spacer()
                TextField("email", text: $email)
                    .padding()
                    .frame(height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                                
                TextField("password", text: $password)
                    
                    .padding()
                    .frame(height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                
                loginView
                Spacer()
            }
            
        }
    }
    
    private var loginView: some View {
        HStack(spacing: 16) {
            Button {
                viewModel.callLoginApi(email: email, password: password)
            }label: {
                Text("Login")
            
                    .frame(width: 250, height: 60)
                .background(Color.gray)
                .foregroundStyle(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 2)
                )
                .cornerRadius(8)
                
            }
           
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email:"", password: "")
    }
}
