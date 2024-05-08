//
//  MainBackgroundView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        GeometryReader { reader in
            Image("bkg")
                .resizable()
                .scaledToFill()
                .frame(width: reader.size.width)
                .ignoresSafeArea()
                .overlay {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                }
        }
    }
}

#Preview {
    MainBackgroundView()
}
