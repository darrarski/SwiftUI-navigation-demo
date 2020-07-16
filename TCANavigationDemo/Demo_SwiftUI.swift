import SwiftUI
import os.log

struct Demo_SwiftUI_View: View {
  @State private var isPresentingSecondView = false

  var body: some View {
    NavigationView {
      List {
        NavigationLink(
          destination: Group {
            if self.isPresentingSecondView {
              SecondView()
            } else {
              EmptyView()
            }
          },
          isActive: .init(get: {
            self.isPresentingSecondView
          }, set: { isActive in
            os_log("Demo_SwiftUI_View.isPresentingSecondView = %@", "\(isActive)")
            self.isPresentingSecondView = isActive
          }),
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
        destination: Group {
          if self.isPresentingThirdView {
            ThirdView()
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.isPresentingThirdView
        }, set: { isActive in
          os_log("SecondView.isPresentingThirdView = %@", "\(isActive)")
          self.isPresentingThirdView = isActive
        }),
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
        destination: Group {
          if self.isPresentingFourthView {
            FourthView()
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.isPresentingFourthView
        }, set: { isActive in
          os_log("ThirdView.isPresentingFourthView = %@", "\(isActive)")
          self.isPresentingFourthView = isActive
        }),
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
