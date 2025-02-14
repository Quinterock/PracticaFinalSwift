//
//  PracticaFinalSwiftTesting.swift
//  PracticaFinalSwiftTesting
//
//  Created by Luis Quintero on 13/02/25.
//

import Testing

struct PracticaFinalSwiftTesting {
    let main = MenuController()
    @Test func example() async throws {
        #expect(main.users.count == 2)
    }
}
