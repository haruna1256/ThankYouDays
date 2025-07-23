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
            VStack{
                Image("box")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Button {
                    print("追加ボタンが押された")
                } label: {
                    Text("Thanks Box")
                            .foregroundStyle(Color.textDarkGray)
                }
            }
            
        }
        
       
    }
}

#Preview {
    ContentView()
}
