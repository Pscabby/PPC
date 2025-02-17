import SwiftUI
import Combine

// Timer Management: Make sure Timer will not be reset when Home rerendering
class TimerManager: ObservableObject {
    @Published var timeRemaining: CGFloat = 60
    @Published var isRunning = false
    private var timerCancellable: AnyCancellable?
    
    init() {
        startTimer()
    }
    
    func startTimer() {
        if timerCancellable == nil {
            timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    if self.isRunning && self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                }
        }
    }
    
    func resetTimer() {
        isRunning = false
        timeRemaining = 60
    }
    
    func pauseTimer() {
        isRunning = false
    }
    
    func resumeTimer() {
        isRunning = true
    }
}

struct Home: View {
    @State private var breathCount = 0
    @StateObject private var timerManager = TimerManager()
    
    struct ToolbarItem: Identifiable {
        var id: Int
        var icon: String
        var text: String
    }

    var isRest = true
    let mainColor = Color(red: 255/255, green: 105/255, blue: 161/255, opacity: 1)

    let toolbarItems: [ToolbarItem] = [
        ToolbarItem(id: 2001, icon: "moon.zzz", text: "睡眠中"),
        ToolbarItem(id: 2002, icon: "lungs.fill", text: "呼吸費力"),
        ToolbarItem(id: 2003, icon: "square.and.arrow.down.fill", text: "儲存")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    TimerView(timerManager: timerManager)
                    
                    Button(action: {
                        if !timerManager.isRunning {
                            timerManager.resumeTimer()  // Timer start
                        }
                        breathCount += 1
                    }) {
                        Image("lung")
                            .resizable()
                            .frame(width: 300, height: 250)
                    }
                }
                .padding(.bottom, 60)
                
                HStack {
                    Button {
                        timerManager.resetTimer()
                        breathCount = 0
                    } label: {
                        VStack {
                            Image(systemName: "arrow.counterclockwise")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("歸零")
                                .font(.title)
                        }
                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Text(isRest ? "休息時" : "費力時")
                        Text("呼吸速率")
                        Text("\(breathCount)")
                        Text("次/分鐘")
                    }
                    .font(.title)
                    .foregroundStyle(.pink)
                    .frame(maxWidth: .infinity)

                    Button {
                        timerManager.pauseTimer()
                    } label: {
                        VStack {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("暫停")
                                .font(.title)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        ForEach(toolbarItems) { item in
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(systemName: item.icon)
                                    Text(item.text)
                                        .font(.title3)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .foregroundStyle(.pink)
        }
    }
}

// 60s Timer
struct TimerView: View {
    @ObservedObject var timerManager: TimerManager
    let totalTime: CGFloat = 60

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 15)
            Circle()
                .trim(from: 0, to: 1 - timerManager.timeRemaining / totalTime)
                .stroke(Color.pink, lineWidth: 15)
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 1), value: timerManager.timeRemaining)
        }
        .frame(width: 350, height: 350)
    }
}

#Preview {
    Home()
}
