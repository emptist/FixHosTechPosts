//
//  OptionalTextField.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/8/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
