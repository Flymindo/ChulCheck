//
//  ContentView.swift
//  ChulCheck
//
//  Created by Dohun Ji on 2021/06/10.
//

import SwiftUI
//import Combine


struct ContentView: View {
    
    
    @State var showDetails = false
    @State var newClassName : String = ""
    @State private var isActionSheetPresented = false
    @State private var isAlertPresented = false
    
    
//    @ObservedObject var classStore = ClassStore()
     
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Course.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Course.courseName, ascending: true)])
    var courses: FetchedResults<Course>
    
//    @FetchRequest(
//        entity: Student.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)])
//    var students: FetchedResults<Student>
    
    
    
    var classDetailView: some View{
        Text("Hello World")
    }
    
    
    var addClassView: some View{
        VStack{
//            TextField("A Class to Add", text: $newClassName)
//            let aCourse = Course(context: managedObjectContext)
//            aCourse.courseName = ""
            TextField("A Class to Add", text: $newClassName)
            
            
            Button(action: {
                let aCourse = Course(context: viewContext)
                aCourse.courseName = newClassName
//                PersistenceController.shared.save()
                do{
                    try viewContext.save()
                }
                catch{
                    let error = error as NSError
                    fatalError("Unresolved Error")
                }
                newClassName = ""
            },
            label: {
                Text("Add")}
            )
        }
    }

    func courseDelete(at offsets : IndexSet){
        for index in offsets{
            let aacourse = courses[index]
            PersistenceController.shared.delete(aacourse)
    }
    }
    
    var body: some View {
//
        
        VStack(content: {
            
            MainTitle()
            
            NavigationView {

                VStack
                {
                    HStack{
                        Spacer()
                        NavigationLink(destination:addClassView)
                        {
                            Image(systemName:"plus").imageScale(.large)
                                .padding()
                        }
                    }
                    List {

                    ForEach(courses, id: \.self){  acourse in
                        Text(acourse.courseName ?? "Unknown")
                    }
    //                    .onMove(perform:self.move)
//                        .onDelete(perform: courseDelete)
                    }
                }
                .navigationBarTitle("Courses")
               
                .navigationBarItems(trailing: EditButton())
            }
                
            }
        )
    }

}
    
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct MainTitle: View {
    var body: some View {
        Text("Chul Check")
            .fontWeight(.heavy)
            .foregroundColor(Color.green)
//            .padding()
            .font(.title)
    }
}



struct WithinClasses: View{
    var body: some View{
        Text("Hello World")
    }
    
    
}

