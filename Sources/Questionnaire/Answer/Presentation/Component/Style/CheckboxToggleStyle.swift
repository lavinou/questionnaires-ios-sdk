//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "square.inset.filled" :"square"
            )
            configuration.label
        }.onTapGesture {
            withAnimation {
                configuration.isOn = !configuration.isOn
            }
        }
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static var check: CheckboxToggleStyle { .init() }
}
