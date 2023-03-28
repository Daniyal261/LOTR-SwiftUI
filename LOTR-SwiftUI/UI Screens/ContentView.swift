//
//  ContentView.swift
//  LOTR-SwiftUI
//
//  Created by Raja Adeel Ahmed on 3/28/23.
//

import SwiftUI

struct ContentView: View {

    @State var leftCurrency:Currency = .silverPiece
    @State var rightCurrency:Currency = .goldPiece
    @State var showSelecCurrency = false
    @State var showExchangeInfo = false
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmount = ""
    @State var rightAmountTemp = ""




    var body: some View {
        ZStack {
            //Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //Pricing pony image
                
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //Currency exchange text
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // Currency Conversion Section
                HStack {
                    
                    // Left Conversion Section
                    VStack {
                        //Currency
                        HStack {
                            //Currency image

                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency text
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelecCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelecCurrency) {
                            CurrencySelection(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //Text Field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .onChange(of: leftTyping ? leftAmount: leftAmountTemp) {
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) {
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                        
                    }
                    
                    // Equal image
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    // Right Conversion Section
                    VStack {
                        //Currency
                        HStack {
                            //Currency image

                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency text
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelecCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelecCurrency) {
                            CurrencySelection(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        // TextField
                        TextField("Amount", text: $rightAmount, onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .onChange(of: rightTyping ? rightAmount: rightAmountTemp) {
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) {
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }

                        
                    }
                    

                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                //Spacer
                Spacer()
                // Button Info
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
