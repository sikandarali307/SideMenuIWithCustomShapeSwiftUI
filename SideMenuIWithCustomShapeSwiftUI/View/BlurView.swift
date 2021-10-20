//
//  BlurView.swift
//  SideMenuIWithCustomShapeSwiftUI
//
//  Created by Sikandar Ali on 20/10/2021.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    let style :UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view 
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
         
    }
}
 
