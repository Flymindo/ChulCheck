//
//  ChulCheckApp.swift
//  ChulCheck
//
//  Created by Dohun Ji on 2021/06/10.
//

import SwiftUI


@main
struct ChulCheckApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


