//
//  MainView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            GeometryReader { reader in
                Image("bkg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width)
                    .ignoresSafeArea()
                    .overlay {
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                    }
            }
            
            VStack {
                Text("강남역")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                
                GeometryReader { reader in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Color.clear
                            
                            Color.yellow
                                .frame(height: 200)
                        }
                        .frame(height: reader.size.height)
                        
                        Spacer(minLength: reader.safeAreaInsets.bottom)
                        
                        Color.green
                            .frame(height: 1000)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
