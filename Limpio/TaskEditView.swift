//
//  TaskEditView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct TaskEditView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    @Binding var task: Room.Task
    @State private var taskName: String = ""
    @State private var user1 = false
    @State private var user2 = false
    @State private var user3 = false
    
    var body: some View {
        Form {
            TextField("Task name", text: $taskName)
            if #available(watchOS 9.0, *) {
                Stepper("Frequency: \(task.frequency)", value: $task.frequency)
            }
            Toggle("Brandon", isOn: $user1)
            Toggle("Solis", isOn: $user2)
            Toggle("Mazza", isOn: $user3)
        }
        .navigationTitle("Edit Task")
        .task {
            taskName = task.name
        }
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskEditView(viewModel: RoomsViewModel(), task: .constant(Room.Task.editPreview))
        }
    }
}
