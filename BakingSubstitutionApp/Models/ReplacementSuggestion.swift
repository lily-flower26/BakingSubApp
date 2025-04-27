//
//  ReplacementSuggestion.swift
//  BakingSubstitutionApp
//
//  Created by Advika Chaudhari on 4/26/25.
//

import Foundation

struct ReplacementSuggestion: Identifiable {
    let id = UUID()
    let title: String
    let quantity: String
    let instructions: String
}

