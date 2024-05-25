//
//  MyWebView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/26/24.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    

    
}
