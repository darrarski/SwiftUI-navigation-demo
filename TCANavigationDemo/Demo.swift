import SwiftUI
import os.log

struct DemoState {
  var firstState: FirstState
}

struct DemoView: View {
  @State var state = DemoState(
    firstState: FirstState(
      secondState: nil
    )
  )

  var body: some View {
    NavigationView {
      FirstView(state.firstState)
    }
  }
}

struct DemoView_Previews: PreviewProvider {
  static var previews: some View {
    DemoView()
  }
}

// MARK: - First Screen

struct FirstState {
  var secondState: SecondState?
}

struct FirstView: View {
  init(_ state: FirstState) {
    self._state = State(initialValue: state)
  }

  @State var state: FirstState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.secondState != nil {
            SecondView(self.state.secondState!)
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.state.secondState != nil
        }, set: { isActive in
          os_log("[First] → [Second] is active: %@", isActive ? "✅" : "❌")
          self.state.secondState = isActive ? .init() : nil
        }),
        label: { Text("Second") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("First")
  }
}

// MARK: - Second Screen

struct SecondState {
  var thirdState: ThirdState?
}

struct SecondView: View {
  init(_ state: SecondState) {
    self._state = State(initialValue: state)
  }

  @State var state: SecondState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.thirdState != nil {
            ThirdView(self.state.thirdState!)
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.state.thirdState != nil
        }, set: { isActive in
          os_log("[Second] → [Third] is active: %@", isActive ? "✅" : "❌")
          self.state.thirdState = isActive ? .init() : nil
        }),
        label: { Text("Third") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Second")
  }
}

// MARK: - Third State

struct ThirdState {
  var fourthState: FourthState?
}

struct ThirdView: View {
  init(_ state: ThirdState) {
    self._state = State(initialValue: state)
  }

  @State var state: ThirdState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.fourthState != nil {
            FourthView(self.state.fourthState!)
          } else {
            EmptyView()
          }
        },
        isActive: .init(get: {
          self.state.fourthState != nil
        }, set: { isActive in
          os_log("[Third] → [Fourth] is active: %@", isActive ? "✅" : "❌")
          self.state.fourthState = isActive ? .init() : nil
        }),
        label: { Text("Fourth") }
      )
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Third")
  }
}

// MARK: - Fourth Screen

struct FourthState {}

struct FourthView: View {
  init(_ viewState: FourthState) {
    self._state = State(initialValue: viewState)
  }

  @State var state: FourthState

  var body: some View {
    List {
      Text("End")
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Fourth")
  }
}
