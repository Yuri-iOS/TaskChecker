//
//  DomainMapper.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import Foundation

protocol DomainMapper<V, DomainModel> {
    associatedtype V
    associatedtype DomainModel
    
    func mapToDomainModel(_ entity: V) -> DomainModel
    func mapToV(_ entity: DomainModel) -> V
}
