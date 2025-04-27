//
//  IngredientPickerView.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/20/25.
//

import SwiftUI

struct IngredientPickerView: View {
    let selectedDessert: String

    @State private var selectedIngredient: String? = nil
    @State private var customIngredient: String = ""
    @State private var showingCustomIngredientField = false
    @State private var navigateToResults = false

    let ingredients = [
        "Eggs", "Butter", "Salted Butter", "Flour", "Milk", "Baking Soda",
        "Baking Powder", "Buttermilk", "Vanilla",
        "Chocolate", "Sugar", "Other"
    ]

    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.94, blue: 0.95) // baby pink
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("Whatcha Missin’? 🥄")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.brown)
                        .padding(.top, 40)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 20)], spacing: 20) {
                        ForEach(ingredients, id: \.self) { ingredient in
                            DessertCard(title: ingredient, isSelected: selectedIngredient == ingredient)
                                .onTapGesture {
                                    selectedIngredient = ingredient
                                    if ingredient == "Other" {
                                        showingCustomIngredientField = true
                                    } else {
                                        showingCustomIngredientField = false
                                        customIngredient = ""
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    if showingCustomIngredientField {
                        TextField("Type your ingredient here...", text: $customIngredient)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }

                    Button(action: {
                        navigateToResults = true
                    }) {
                        Text("See Substitutes")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background((selectedIngredient == nil || (selectedIngredient == "Other" && customIngredient.isEmpty)) ? Color.gray : Color.blue.opacity(0.6))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    .disabled(selectedIngredient == nil || (selectedIngredient == "Other" && customIngredient.isEmpty))
                    .fullScreenCover(isPresented: $navigateToResults) {
                        ResultView(
                            dessert: selectedDessert,
                            missingIngredient: finalIngredient()
                        )
                    }
                }
                .padding(.bottom)
            }
        }
    }

    private func finalIngredient() -> String {
        if selectedIngredient == "Other" {
            return customIngredient
        } else {
            return selectedIngredient ?? "Other"
        }
    }
}
