//
//  Hasady_FinApp.swift
//  Hasady-Fin
//
//  Created by Shhooda on 29/08/2022.
//


        import SwiftUI

        @main
        struct Hasady_FinApp: App {
            @StateObject var data = TimerData()
            var body: some Scene {
                WindowGroup {
                    ContentView()
                        .environmentObject(data)
                }
            }
        }

