//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation
import Combine

class UserObservable: ObservableObject {
    
    private let manager: UserManager
    private var cancellables: Set<AnyCancellable> = Set()
    @Published var user: User? = nil
    
    init(manager: UserManager) {
        self.manager = manager
        Task(operation: {
            let _ = await self.manager.current()
            self.manager.user
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: {
                    if let user = $0 {
                        self.user = user
                    }
            }).store(in: &cancellables)
        })
    }
}
