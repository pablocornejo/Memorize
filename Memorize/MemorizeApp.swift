//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pablo Cornejo on 5/25/21.
//  Copyright © 2021 Pablo Cornejo Pierola. All rights reserved.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
