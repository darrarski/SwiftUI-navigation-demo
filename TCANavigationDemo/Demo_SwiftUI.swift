import SwiftUI
import os.log

struct Demo_SwiftUI_View: View {
  struct ViewState {
    var secondState: SecondView.ViewState?
  }

  @State private var viewState: ViewState

  init(_ viewState: ViewState) {
    self._viewState = State(initialValue: viewState)
  }

  var body: some View {
    NavigationView {
      List {
        NavigationLink(
          destination: Group {
            if self.viewState.secondState != nil {
              SecondView(self.viewState.secondState!)
            } else {
              EmptyView()
            }
          },
          isActive: .init(get: {
            self.viewState.secondState != nil
          }, set: { isActive in
            os_log("Demo_SwiftUI_View.isPresentingSecondView = %@", "\(isActive)")
            self.viewState.secondState = isActive ? .init() : nil
          }),
          label: { Text("Second View") }
        )
      }.listStyle(GroupedListStyle())
        .navigationBarTitle("Demo SwiftUI")
    }
  }
}

struct SecondView: View {
  struct ViewState {
    var thirdState: ThirdView.ViewState?
  }

  @State private var viewState: ViewState

  init(_ viewState: ViewState) {
    self._viewState = State(initialValue: viewState)
  }

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.viewState.thirdState != nil {
            ThirdView(self.viewState.thirdState!)
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.viewState.thirdState != nil
        }, set: { isActive in
          os_log("SecondView.isPresentingThirdView = %@", "\(isActive)")
          self.viewState.thirdState = isActive ? .init() : nil
        }),
        label: { Text("Third View") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Second View")
  }
}

struct ThirdView: View {
  struct ViewState {
    var fourthState: FourthView.ViewState?
  }

  init(_ viewState: ViewState) {
    self._viewState = State(initialValue: viewState)
  }

  @State private var viewState: ViewState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.viewState.fourthState != nil {
            FourthView(self.viewState.fourthState!)
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.viewState.fourthState != nil
        }, set: { isActive in
          os_log("ThirdView.isPresentingFourthView = %@", "\(isActive)")
          self.viewState.fourthState = isActive ? .init() : nil
        }),
        label: { Text("Fourth View") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Third View")
  }
}

struct FourthView: View {
  struct ViewState {}

  @State private var viewState: ViewState

  init(_ viewState: ViewState) {
    self._viewState = State(initialValue: viewState)
  }

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
    Demo_SwiftUI_View(.init())
  }
}
#endif
