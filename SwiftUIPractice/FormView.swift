//
//  FormView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 20/10/23.
//

import SwiftUI

struct FormView: View {
    
    @State private var quantity = 4 // Example initial value
        @State private var dueDate = Date() // Example initial date
        @State private var pickerSelection = 3
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Plain Text")
                    Stepper(value: $quantity, in: 0...10) {
                        Text("Quantity: \(quantity)")
                    }
                }
                
                Section {
                    DatePicker("Due Date", selection: $dueDate, in: Date()...)
                    Picker("Picker Name", selection: $pickerSelection) {
                        Text("Value 1").tag(0)
                        Text("Value 2").tag(1)
                        Text("Value 3").tag(2)
                        Text("Value 4").tag(3)
                    }
                }
                
                    Section {
                        Text("Plain Text")
                        Stepper(value: $quantity, in: 0...10) {
                            Text("Quantity: \(quantity)")
                        }
                    }
                    
                    Section {
                        DatePicker("Due Date", selection: $dueDate, in: Date()...)
                        Picker("Picker Name", selection: $pickerSelection) {
                            Text("Value 1").tag(0)
                            Text("Value 2").tag(1)
                            Text("Value 3").tag(2)
                            Text("Value 4").tag(3)
                        }
                    }
                
                    Section {
                        Text("Plain Text")
                        Stepper(value: $quantity, in: 0...10) {
                            Text("Quantity: \(quantity)")
                        }
                    }
                    
                    Section {
                        DatePicker("Due Date", selection: $dueDate, in: Date()...)
                        Picker("Picker Name", selection: $pickerSelection) {
                            Text("Value 1").tag(0)
                            Text("Value 2").tag(1)
                            Text("Value 3").tag(2)
                            Text("Value 4").tag(3)
                        }
                    }
                
                    Section {
                        Text("Plain Text")
                        Stepper(value: $quantity, in: 0...10) {
                            Text("Quantity: \(quantity)")
                        }
                    }
                    
                    Section {
                        DatePicker("Due Date", selection: $dueDate, in: Date()...)
                        Picker("Picker Name", selection: $pickerSelection) {
                            Text("Value 1").tag(0)
                            Text("Value 2").tag(1)
                            Text("Value 3").tag(2)
                            Text("Value 4").tag(3)
                        }
                    }
                
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
