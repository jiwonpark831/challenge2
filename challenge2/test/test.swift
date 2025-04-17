import SwiftUI

struct test: View {
    @State var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                Text("Root View").font(.title)
                
                Button(action: {
                    path.append("next view")
                }, label: {
                    Text("See Next view")
                })
            }
            .navigationDestination(for: String.self) { string in
                if string == "next view" {
                    NextView(path: $path)
                } else if string == "next next view" {
                    NextNextView(path: $path)
                }
            }
        }
    }
}

struct NextView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Text("Next View").font(.title)
        
        Button(action: {
            path.append("next next view")
        }, label: {
            Text("See Next next view")
        })
    }
}

struct NextNextView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Text("Next next view").font(.title)
        
        Button {
            while path.count > 0 {
                path.removeLast()
            }
        } label: {
            Text("Back to root view")
        }
    }
}



#Preview {
    test()
}
