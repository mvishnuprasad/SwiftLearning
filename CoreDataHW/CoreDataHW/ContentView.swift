//
//  ContentView.swift
//  CoreDataHW
//
//  Created by vishnu on 25/11/22.
//

import SwiftUI

struct ContentView: View {
    let coredataManager : CoreDataManager
    @State private var name : String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needRefresh : Bool = false
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Button("Save", action: {
                    coredataManager.saveMovie(title: name)
                    movies = coredataManager.getMovies()
                })
                .padding(.all,10)
                .foregroundColor(.red)
                .background(Color.yellow)
                .cornerRadius(20)
                Spacer()
                List{
                    ForEach (movies, id: \.self)  { movie in
                        NavigationLink(destination: MovieDetail(movie: movie, coreDM: coredataManager, refresh : $needRefresh), label: {
                            Text(movie.title ??  "")
                        })
                      
                    }.onDelete(perform: { IndexSet in
                        IndexSet.forEach({index in
                            let movie = movies[index]
                            coredataManager.deleteMovie(movie: movie)
                            movies = coredataManager.getMovies()
                        })
                    })
                }.listStyle(.plain)
                    .accentColor(needRefresh ? .red : .white)
            }
            .onAppear{
                movies = coredataManager.getMovies()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coredataManager: CoreDataManager())
    }
}
