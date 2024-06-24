//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/23/24.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { .init() }
}
