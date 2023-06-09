//
//  ExchangeRate.swift
//  LOTR-SwiftUI
//
//  Created by Raja Adeel Ahmed on 3/28/23.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage:String
    @State var text:String
    @State var rightImage:String

    var body: some View {
        HStack {
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // Exchange Rate Text
            Text(text)
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
