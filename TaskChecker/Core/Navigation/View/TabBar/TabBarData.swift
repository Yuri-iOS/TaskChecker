//
//  BasisScreenData.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import Foundation

struct TabBarData<V: ScreenDelegate> {
    let title: String
    let icon: String
    let destination: V
}
