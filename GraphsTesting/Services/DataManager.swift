//
//  DataManager.swift
//  GraphsTesting
//
//  Created by Александр on 08.01.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var weightList: [PersonInfo] = []
    private let second = PersonInfo(weight: 70, date: Date())
    
    private init() {}
    
    func createTestData() -> [PersonInfo] {
        let first = PersonInfo(weight: 67, date: Date())
        let third = PersonInfo(weight: 73, date: Date())
        let fourth = PersonInfo(weight: 69, date: Date())
        let fifth = PersonInfo(weight: 72, date: Date())
        let sixth = PersonInfo(weight: 62, date: Date())


        weightList.append(first)
        weightList.append(second)
        weightList.append(third)
        weightList.append(fourth)
        weightList.append(fifth)
        weightList.append(sixth)


        return weightList
    }
    
}
