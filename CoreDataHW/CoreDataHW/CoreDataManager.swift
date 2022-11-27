//
//  CoreDataManager.swift
//  CoreDataHW
//
//  Created by vishnu  on 27/11/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer=NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores(completionHandler: { (description,error) in
            if let err = error {
                fatalError("\(err.localizedDescription)")
            }
        })
        
    }
    
    
    func saveMovie(title: String){
        let context = persistentContainer.viewContext
        let movie = Movie(context: context)
        movie.title = title
        do{
            try context.save()
        } catch{
            print("failed to save")
        }
        
    }
    func updateMovie(){
        let context = persistentContainer.viewContext
        do{
            try context.save()
        } catch{
            print("failed to save")
        }

    }
    
    func getMovies()-> [Movie]{
        let fetchReq : NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do{
            return  try  persistentContainer.viewContext.fetch(fetchReq)
        } catch{
            return []
        }
    }
    func deleteMovie (movie: Movie){
        let context = persistentContainer.viewContext
        context.delete(movie)
        do{
            try context.save()
        } catch{
            print("failed to delete")
        }
    }
    
}
