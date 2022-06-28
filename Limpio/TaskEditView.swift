//
//  TaskEditView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct TaskEditView: View {
    
    @Binding var task: Room.Task
    @State private var taskName: String = ""
    @State private var participant1 = false
    @State private var participant2 = false
    @State private var participant3 = false
    
    var body: some View {
        Form {
            TextField("Task name", text: $taskName)
            if #available(watchOS 9.0, *) {
                Stepper("Frequency: \(task.frequency)", value: $task.frequency)
            }
            Toggle("Brandon", isOn: $participant1)
            Toggle("Solis", isOn: $participant2)
            Toggle("Mazza", isOn: $participant3)
        }
        .navigationTitle("Edit Task")
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskEditView(task: .constant(Room.Task.editPreview))
        }
    }
}
