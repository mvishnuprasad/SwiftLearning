//

//  ContentView.swift

//  Firm

//

//  Created by VISHNU PRASAD M on 19/04/21.

//



import SwiftUI

#if canImport(UIKit)

extension View {

    func dismissKeyboard(){

        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }

}



#endif



struct ContentView: View {

    @State var FirstName:String=""

    @State var EmailAddress:String=""

    @State var Password:String=""

    @State var PasswordC:String=""

    @State var LabelText:String=""

    

    

    var body: some View {

        

        NavigationView{

            

            VStack{

                Form{

                    

                    Section{

                        TextField("Enter your Full Name", text: $FirstName)

                        TextField("Enter your email Address", text: $EmailAddress)

                        

                        

                    }

                    Section(footer:Text("Password should be 8 characters or longer")){

                        

                        SecureField("Enter your password", text: $Password)

                        SecureField("Confirm your password", text: $PasswordC)

                        Label(LabelText, systemImage: "eye")

                        Button(action: {

                            

                            if self.Password==self.PasswordC{

                                

                                self.LabelText=Password

                            }

                            else{

                                self.LabelText="Passwords Dont match"

                            }

                        }, label: {

                            Text("Show Password")

                        })

                    }

                }

                Button(action: {

                }

                

                , label: {

                    Text("Sign Up")

                        .frame(width: 100, height: 43, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                        .background(Color.blue)

                        .foregroundColor(.white)

                        .cornerRadius(17)

                    

                })

                Spacer()

                Section(footer:Text("Forgot Password?")

                            .font(.system(size: 13))

                ){}

                

                Spacer()

                Spacer()

                Spacer()

            }

            .navigationTitle("Sign Up")

            

        }

        

    }

    

}













struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}