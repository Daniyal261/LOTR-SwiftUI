//
//  CurrencySelection.swift
//  LOTR-SwiftUI
//
//  Created by Raja Adeel Ahmed on 3/28/23.
//

import SwiftUI

struct CurrencySelection: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency:Currency
    @Binding var rightCurrency:Currency

    var body: some View {
        ZStack {
            //Background Image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // Currency Icons

                IconGrid(selectedCurrency: $leftCurrency)

                //Text
                Text("Select the currency you would like to convenrt to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency Icon
                IconGrid(selectedCurrency: $rightCurrency)

                // Done Button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
 
            }
        }
    }
}

struct CurrencySelection_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelection(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
