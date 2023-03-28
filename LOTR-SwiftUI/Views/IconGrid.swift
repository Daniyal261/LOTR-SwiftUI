//
//  IconGrid.swift
//  LOTR-SwiftUI
//
//  Created by Raja Adeel Ahmed on 3/28/23.
//

import SwiftUI

struct IconGrid: View {
    @Binding  var selectedCurrency: Currency
    @State var GridLayout = [GridItem(),GridItem(),GridItem()]

    var body: some View {
        LazyVGrid(columns:GridLayout) {
            ForEach(0..<5) { index in
                if Currency.allCases[index] == selectedCurrency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[index].rawValue, currencyText: CurrencyText.allCases[index].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                        .shadow(color:.black, radius: 9)
                        
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[index].rawValue, currencyText: CurrencyText.allCases[index].rawValue)
                        .onTapGesture {
                            selectedCurrency = Currency.allCases[index]
                        }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(selectedCurrency: .constant(.silverPiece))
    }
}
