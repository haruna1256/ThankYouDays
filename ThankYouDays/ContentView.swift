//
//  ContentView.swift
//  ThankYouDays
//
//  Created by 川岸遥奈 on 2025/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundIvory
                .edgesIgnoringSafeArea(.all)
            
            Image("box")
                .resizable()
                .frame(width: 300, height: 300)
        }
        
       
    }
}

#Preview {
    ContentView()
}
