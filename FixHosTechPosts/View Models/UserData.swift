//
//  UserData.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showKeysOnly = false
    @Published var elements = elementData/*.sorted(by: { $0.pinyin < $1.pinyin })*/ {
        didSet {
            DispatchQueue.global(qos: .userInteractive).async {
                save(self.elements)
            }
        }
    }

    func addElement(_ newName:String) -> Void {
        for each in elements {
            if each.科室名称 == newName {
                return
            }
        }
        elements.append(Element(科室名称:newName))
    }
}
