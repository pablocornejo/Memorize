//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pablo Cornejo on 5/26/20.
//  Copyright © 2020 Pablo Cornejo Pierola. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card)
                .onTapGesture {
                    self.viewModel.choose(card: card)
            }
            .padding()
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Pie(startAngle: .degrees(-90), endAngle: .degrees(20), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
            } else if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing constants
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
