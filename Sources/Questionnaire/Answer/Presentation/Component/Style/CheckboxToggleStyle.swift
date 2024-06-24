//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    let onClick: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "square.inset.filled" :"square"
            )
            configuration.label
        }.onTapGesture {
            withAnimation {
                onClick()
            }
        }
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static func check(onCick: @escaping () -> Void) -> CheckboxToggleStyle {
        CheckboxToggleStyle(onClick: onCick)
    }
}
