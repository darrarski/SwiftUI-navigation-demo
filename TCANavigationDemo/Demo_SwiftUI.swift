import SwiftUI

struct Demo_SwiftUI_View: View {
  @State private var isPresentingSecondView = false

  var body: some View {
    NavigationView {
      List {
        NavigationLink(
          destination: SecondView(),
          isActive: $isPresentingSecondView,
          label: { Text("Second View") }
        )
      }.listStyle(GroupedListStyle())
        .navigationBarTitle("Demo SwiftUI")
    }
  }
}

private struct SecondView: View {
  @State private var isPresentingThirdView = false

  var body: some View {
    List {
      NavigationLink(
        destination: ThirdView(),
        isActive: $isPresentingThirdView,
        label: { Text("Third View") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Second View")
  }
}

private struct ThirdView: View {
  @State private var isPresentingFourthView = false

  var body: some View {
    List {
      NavigationLink(
        destination: FourthView(),
        isActive: $isPresentingFourthView,
        label: { Text("Fourth View") }
      )
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
