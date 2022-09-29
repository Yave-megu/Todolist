import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var todoLists : TodoLists
    
    var body: some View {
        VStack {
            HeaderView()
            TextFieldView()
            TodoListView()
            SaveLoadButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoLists())
    }
}
