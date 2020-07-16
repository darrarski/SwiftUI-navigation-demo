import SwiftUI

struct Demo_SwiftUI_View: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: SecondView()) {
          Text("Second View")
        }
      }.listStyle(GroupedListStyle())
        .navigationBarTitle("Demo SwiftUI")
    }
  }
}

private struct SecondView: View {
  var body: some View {
    List {
      NavigationLink(destination: ThirdView()) {
        Text("Third View")
      }
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Second View")
  }
}

private struct ThirdView: View {
  var body: some View {
    List {
      NavigationLink(destination: FourthView()) {
        Text("Fourth View")
      }
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Third View")
  }
}

private struct FourthView: View {
  var body: some View {
    List {
      EmptyView()
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Fourth View")
  }
}

#if DEBUG
struct Demo_SwiftUI_Previews: PreviewProvider {
  static var previews: some View {
    Demo_SwiftUI_View()
  }
}
#endif
