//
//  TaskListView.swift
//  TaskManager
//
//  Created by OD Orafidiya on 5/18/24.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    TaskListView(title:"All", tasks: Task.examples())
}
