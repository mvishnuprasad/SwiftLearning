//
//  MovieDetail.swift
//  CoreDataHW
//
//  Created by vishnu on 27/11/22.
//

import SwiftUI

struct MovieDetail : View{
    let movie : Movie
    let coreDM : CoreDataManager
    @Binding var refresh : Bool
    @State private var moviename : String = ""
    var body : some View{
        VStack{
            TextField(movie.title ?? "", text: $moviename)
                .textFieldStyle(.roundedBorder)
            Button("Save", action: {
                if !moviename.isEmpty{
                    movie.title = moviename
                    
                        coreDM.updateMovie()
                    refresh.toggle()
                }
            })
            .padding(.all,10)
            .foregroundColor(.red)
            .background(Color.yellow)
            .cornerRadius(20)
            Spacer()
        }
    }
}
struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager().persistentContainer.viewContext
        let movie = Movie(context: context)
        MovieDetail(movie: movie, coreDM: CoreDataManager(), refresh: .constant(false))
    }
}
