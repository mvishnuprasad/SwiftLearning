//
//  CoreDataHWApp.swift
//  CoreDataHW
//
//  Created by vishnu on 25/11/22.
//

import SwiftUI

@main
struct CoreDataHWApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coredataManager: CoreDataManager())
        }
    }
}
