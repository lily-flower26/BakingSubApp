//
//  SplashView.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/20/25.
//

import SwiftUI

struct SplashView: View {
    @State private var rotateWhisk = false
    @State private var navigateToNext = false

    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.87, blue: 0.91) // soft pink background
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("WhiskIcon")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(rotateWhisk ? 360 : 0))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: rotateWhisk)

                Text("loading...")
                    .font(.title2)
                    .foregroundColor(.brown)
            }
        }
        .onAppear {
            rotateWhisk = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                navigateToNext = true
            }
        }
        .fullScreenCover(isPresented: $navigateToNext) {
            RecipeSelectionView() // next screen
        }
    }
}

#Preview {
    SplashView()
}
