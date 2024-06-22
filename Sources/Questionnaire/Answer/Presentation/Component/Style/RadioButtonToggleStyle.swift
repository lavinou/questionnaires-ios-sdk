//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import SwiftUI

struct RadioButtonToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "circle.circle.fill" :"circle"
            )
            configuration.label
        }.onTapGesture {
            withAnimation {
                configuration.isOn = !configuration.isOn
            }
        }
    }
}

extension ToggleStyle where Self == RadioButtonToggleStyle {
    static var radio: RadioButtonToggleStyle { .init() }
}
