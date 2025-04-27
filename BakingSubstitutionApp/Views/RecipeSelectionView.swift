//
//  RecipeSelectionView.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/20/25.
//
import SwiftUI

struct RecipeSelectionView: View {
    @State private var selectedDessert: String? = nil
    @State private var showOtherDessertPrompt = false
    @State private var customDessertName = ""
    @State private var navigateToNext = false

    let desserts = [
        "Cookies", "Brownies", "Cake", "Muffins", "Cupcakes", "Bread", "Pie", "Pastry", "Biscuit", "Other"
    ]

    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.94, blue: 0.95) // baby pink background
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("Whatcha Cookin?")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.brown)
                        .padding(.top, 40)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 20)], spacing: 20) {
                        ForEach(desserts, id: \.self) { dessert in
                            DessertCard(title: dessert, isSelected: selectedDessert == dessert)
                                .onTapGesture {
                                    if dessert == "Other" {
                                        showOtherDessertPrompt = true
                                    } else {
                                        selectedDessert = dessert
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    Button(action: {
                        navigateToNext = true
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedDessert == nil ? Color.gray : Color.blue.opacity(0.6))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    .disabled(selectedDessert == nil)
                    .fullScreenCover(isPresented: $navigateToNext) {
                        IngredientPickerView(selectedDessert: selectedDessert ?? "Other")
                    }
                }
                .padding(.bottom)
            }
            .alert("What's your dessert?", isPresented: $showOtherDessertPrompt, actions: {
                TextField("Type your dessert...", text: $customDessertName)
                Button("Done") {
                    selectedDessert = customDessertName.isEmpty ? "Other" : customDessertName
                }
            })
        }
    }
}

struct DessertCard: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(systemName: "cupcake.fill") // still placeholder!
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .foregroundColor(isSelected ? .white : .pink)

            Text(title)
                .foregroundColor(isSelected ? .white : .brown) // <-- NOW brown text when not selected
                .fontWeight(.semibold)
        }
        .padding()
        .frame(width: 120, height: 120)
        .background(isSelected ? Color.blue.opacity(0.6) : Color.white)
        .cornerRadius(20)
    }
}

#Preview {
    RecipeSelectionView()
}
