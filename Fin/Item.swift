//
//  Item.swift
//  Fin
//
//  Created by shuruq alshammari on 16/06/1446 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
