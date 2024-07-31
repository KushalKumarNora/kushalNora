

import SwiftUI

struct RegisterView: View {
    
    @State var email: String
    @State var password: String
    @StateObject private var viewModel = RegisterViewModel()
    @Binding var isregister: Bool
    @State private var isShowingDetailView = false
    
    @EnvironmentObject private var coordinator: Coordinator
    
    
    
    
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
                
                registerView
                Spacer()
                
//                NavigationLink(destination: LoginView(email: "", password: "") , isActive: $isShowingDetailView) {
//
//                }
            }

        }
        
        .onReceive(viewModel.$isRegister, perform: { newValue in
                      
            if newValue {
              //  isShowingDetailView = true
                //coordinator.push(.login)
            }            
        })
    }
    
    
    private var registerView: some View {
        HStack(spacing: 16) {
            Button {
                viewModel.callRegisterApi(email: email, password: password)
            }label: {
                Text("Register")
            
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(email: "", password: "", isregister: .constant(false))
    }
}
