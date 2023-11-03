//
//  ComplexInterface.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 03/11/23.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: Date
    var isCompleted: Bool
    var isEditing = false
}


struct ListView: View {
    @State private var tasks: [Task] = [
           Task(title: "Buy groceries", dueDate: Date(), isCompleted: false),
           Task(title: "Finish project", dueDate: Date(), isCompleted: true),
           Task(title: "Go to the gym", dueDate: Date(), isCompleted: false)
       ]
    var body: some View {
        NavigationView {
                    List {
                        Section(header: Text("Tasks")) {
                            ForEach(tasks.indices, id: \.self) { task in
                                
                                TaskRowView(task: $tasks[task])
                                    .onTapGesture {
                                            tasks[task].isEditing.toggle()
                                        print(task)
                                    }
                                    .fullScreenCover(isPresented: $tasks[task].isEditing, content: {
                                        TaskEditView(tasks: $tasks,task:task)
                                    })
                            }
                            .onDelete { indexOffset in
                                tasks.remove(atOffsets: indexOffset)
                            }
                            
                        }
                        
                        Section(header: Text("Add Task")) {
                            TaskFormView(tasks: $tasks)
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Task Manager")
                }
    }
}


struct TaskRowView: View {
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Text(task.dueDate, style: .date)
            if task.isCompleted {
                Image(systemName: "checkmark")
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
            } else {
                Image(systemName: "circle")
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
            }
        }
    }
}

struct TaskFormView: View {
    @Binding var tasks: [Task]
    @State private var newTaskTitle: String = ""
    @State private var newTaskDueDate = Date()
    
    var body: some View {
        HStack {
            VStack{
                HStack{
                    Text("Task Title:")
                        .padding(.trailing,10)
                    TextField("Task Title", text: $newTaskTitle)
                }
                HStack{
                    DatePicker("Select Due Date:", selection: $newTaskDueDate, displayedComponents: .date)
                }
            }.padding()
            
            Button(action: {
                tasks.append(Task(title: newTaskTitle, dueDate: newTaskDueDate, isCompleted: false,isEditing: false))
                newTaskTitle = ""
            }) {
                Text("Add Task")
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(50)
        }
    }
}

struct TaskEditView: View {
    @Binding var tasks: [Task]
    var task: Int
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.1)
            VStack {
                VStack{
                    HStack{
                        Text("Task Title:")
                        Spacer()
                        TextField("Task Title", text: $tasks[task].title)
                    }
                    
                    HStack{
                        DatePicker("Select Due Date:", selection: $tasks[task].dueDate, displayedComponents: .date)
                    }
                }.padding()
                
                Button(action: {
//                    tasks.append(Task(title: taskTitle, dueDate: taskDueDate, isCompleted: false))
//                    tasks[task.id] = Task(title: task.title, dueDate: task.dueDate, isCompleted: false)=
                    tasks[task].isEditing.toggle()
                    print(tasks)
            
                }) {
                    Text("Edit Task")
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(50)
            }
            .padding(10)
            .background(.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
