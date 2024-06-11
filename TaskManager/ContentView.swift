//
//  ContentView.swift
//  TaskManager
//
//  Created by OD Orafidiya on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: TaskSection? = TaskSection.all
    
    @State private var allTasks = Task.examples()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: allTasks)
            case .done:
                TaskListView(title: "All", tasks: allTasks.filter({ $0.isCompleted }))
            case .upcoming:
                TaskListView(title: "All", tasks: allTasks.filter({ !$0.isCompleted }))
            case .list(let taskGroup):
                TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            case .none:
                Text("none")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
