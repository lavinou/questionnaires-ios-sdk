//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import SwiftUI

struct RadioButtonToggleStyle: ToggleStyle {
    
    let onClick: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "circle.circle.fill" :"circle"
            )
            configuration.label
        }.onTapGesture {
            withAnimation {
                onClick()
            }
        }
    }
}

extension ToggleStyle where Self == RadioButtonToggleStyle {
    static func radio(onClick: @escaping () -> Void) -> RadioButtonToggleStyle { RadioButtonToggleStyle(
        onClick: onClick)
    }
}
