//
//  TimerView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/20/23.
//

import SwiftUI

struct TimerView: View {
    @State private var currentTime = 1500
    @State private var isTimerRunning = false
    @State private var timer: Timer?

    var body: some View {
        let minutes = currentTime / 60
        let seconds = currentTime % 60

        Rectangle()
            .frame(width: 280, height: 150)
            .foregroundColor(.appGray)
            .cornerRadius(8)
            .overlay {
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("\(String(format: "%02d:%02d", minutes, seconds))")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                    
                    HStack {
                        Button {
                            startTimer()
                        } label: {
                            Text("Start")
                                .fontWeight(.medium)
                        }
                        .buttonStyle(.bordered)
                        .frame(height: 0)
                        .tint(.green)
                        .disabled(isTimerRunning)

                        Button {
                            pauseTimer()
                        } label: {
                            Text("Pause")
                                .fontWeight(.medium)
                        }
                        .buttonStyle(.bordered)
                        .frame(height: 0)
                        .tint(.orange)
                        .disabled(!isTimerRunning)

                        Button {
                            stopTimer()
                        } label: {
                            Text("Stop")
                                .fontWeight(.medium)
                        }
                        .buttonStyle(.bordered)
                        .frame(height: 0)
                        .tint(.red)
                        .disabled(!isTimerRunning && currentTime == 1500)
                    }
                    
                    Spacer()
                }
            }
    }

    func startTimer() {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if currentTime > 0 {
                    currentTime -= 1
                } else {
                    stopTimer()
                }
            }
            isTimerRunning = true
        }
    }

    func pauseTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        currentTime = 1500
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

