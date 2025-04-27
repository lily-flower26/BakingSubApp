//
//  ResultsView.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/26/25.
//

import SwiftUI

struct ResultView: View {
    let dessert: String
    let missingIngredient: String

    var suggestions: [ReplacementSuggestion] {
        let lowerDessert = dessert.lowercased()
        let lowerIngredient = missingIngredient.lowercased()

        return SubstitutionDatabase.substitutions[lowerDessert]?[lowerIngredient]
            ?? SubstitutionDatabase.substitutions["other"]?["other"]
            ?? []
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1.0, green: 0.94, blue: 0.95).ignoresSafeArea() // baby pink background

                VStack(spacing: 20) {
                    Text("Suggestions for \(missingIngredient)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.brown)

                    if suggestions.isEmpty {
                        Text("No suggestions found 😞")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        TabView {
                            ForEach(suggestions) { suggestion in
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(suggestion.title)
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.black)

                                    Text("🧪 Quantity:")
                                        .font(.headline)
                                    Text(suggestion.quantity)

                                    Text("📝 Instructions:")
                                        .font(.headline)
                                    Text(suggestion.instructions)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(radius: 4)
                                .padding(.horizontal)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 320)
                    }

                    NavigationLink(destination: RecipeSelectionView()) {
                        Text("Start Over")
                            .bold()
                            .padding()
                            .background(Color.blue.opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 40)
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}
