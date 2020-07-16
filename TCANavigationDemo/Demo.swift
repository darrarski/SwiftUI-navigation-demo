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
      FirstView($state.firstState)
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
  init(_ state: Binding<FirstState>) {
    self._state = state
  }

  @Binding var state: FirstState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.secondState != nil {
            SecondView(.init(get: { () -> SecondState in
              self.state.secondState ?? .init()
            }, set: { secondState in
              self.state.secondState = secondState
            }))
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
  init(_ state: Binding<SecondState>) {
    self._state = state
  }

  @Binding var state: SecondState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.thirdState != nil {
            ThirdView(.init(get: { () -> ThirdState in
              self.state.thirdState ?? .init()
            }, set: { thirdState in
              self.state.thirdState = thirdState
            }))
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

// MARK: - Third Screen

struct ThirdState {
  var fourthState: FourthState?
}

struct ThirdView: View {
  init(_ state: Binding<ThirdState>) {
    self._state = state
  }

  @Binding var state: ThirdState

  var body: some View {
    List {
      NavigationLink(
        destination: Group {
          if self.state.fourthState != nil {
            FourthView(.init(get: { () -> FourthState in
              self.state.fourthState ?? .init()
            }, set: { fourthState in
              self.state.fourthState = fourthState
            }))
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
  init(_ state: Binding<FourthState>) {
    self._state = state
  }

  @Binding var state: FourthState

  var body: some View {
    List {
      Text("End")
    }.listStyle(GroupedListStyle())
      .navigationBarTitle("Fourth")
  }
}
