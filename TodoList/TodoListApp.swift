

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel = manages Models for View

 */

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
        }
    }
}
