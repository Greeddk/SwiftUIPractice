//
//  WalletView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//
/*
 NavigationLazyView
 NavigationStack
 - animation, overlay, state, picker, scrollView
 
 - 
 */
import SwiftUI

struct WalletView: View {
    
    @State private var isExpandable = false
    
    var body: some View {
        VStack {
            topTitle()
            Spacer()
            Text("Animation On")
                .wrapToButton {
                    withAnimation(.bouncy) {
                        isExpandable = true
                    }
                }
            Text("Animation OFF")
                .wrapToButton {
                    withAnimation(.bouncy) {
                        isExpandable = false
                    }
                }
        }
    }
    
    func topTitle() -> some View {
        HStack {
            Text("Greed Wallet")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
                .overlay(alignment: .trailing) {
                    topOverlayButton()
                }
                .padding()
                .background(.yellow)
        }
    }
    
    func topOverlayButton() -> some View {
        Image(systemName: "plus")
            .foregroundStyle(.white)
            .padding()
            .background(.black, in: Circle())
            .opacity(isExpandable ? 1 : 0)
            .rotationEffect(.degrees(isExpandable ? 225 : 45))
            .wrapToButton {
                withAnimation(.bouncy) {
                    isExpandable = false
                }
            }
    }
}

#Preview {
    WalletView()
}
