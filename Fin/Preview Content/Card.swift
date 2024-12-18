//
//  Card.swift
//  AutismAppTest
//
//  Created by Sumayah Alqahtani on 17/06/1446 AH.
//

import SwiftData
import Foundation

@Model
class Card: Identifiable {
    var id: UUID
    var emoji: String
    var cardDescription: String
    
    init(emoji: String, cardDescription: String) {
        self.id = UUID() // سيتم تعيين UUID تلقائيًا
        self.emoji = emoji
        self.cardDescription = cardDescription
    }
}

