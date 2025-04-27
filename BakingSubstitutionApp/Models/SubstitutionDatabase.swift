//
//  SubstitutionDatabase.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/26/25.
//

import Foundation

struct SubstitutionDatabase {
    static let substitutions: [String: [String: [ReplacementSuggestion]]] = [
        "cookies": [
            "buttermilk": [
                ReplacementSuggestion(
                    title: "Milk + Lemon",
                    quantity: "1 cup milk + 1 tbsp lemon juice",
                    instructions: "Let sit for 5 minutes before using."
                ),
                ReplacementSuggestion(
                    title: "Yogurt",
                    quantity: "1 cup plain yogurt",
                    instructions: "Use 1:1 instead of buttermilk."
                )
            ],
            "eggs": [
                ReplacementSuggestion(
                    title: "Flax Egg",
                    quantity: "1 tbsp flaxseed + 3 tbsp water",
                    instructions: "Mix and let sit 5 minutes to thicken."
                ),
                ReplacementSuggestion(
                    title: "Applesauce",
                    quantity: "1/4 cup unsweetened applesauce",
                    instructions: "Use instead of 1 egg."
                )
            ]
        ],
        "cake": [
            "buttermilk": [
                ReplacementSuggestion(
                    title: "Milk + Vinegar",
                    quantity: "1 cup milk + 1 tbsp vinegar",
                    instructions: "Stir and let sit before using."
                )
            ]
        ],
        "brownies": [
            "eggs": [
                ReplacementSuggestion(
                    title: "Mashed Banana",
                    quantity: "1/4 cup mashed banana",
                    instructions: "Use instead of 1 egg."
                ),
                ReplacementSuggestion(
                    title: "Yogurt",
                    quantity: "1/4 cup plain yogurt",
                    instructions: "Substitute for 1 egg."
                )
            ]
        ],
        "other": [
            "other": [
                ReplacementSuggestion(
                    title: "Custom Substitution",
                    quantity: "Use your best judgment!",
                    instructions: "Substitution tips vary based on recipe."
                )
            ]
        ]
    ]
}

