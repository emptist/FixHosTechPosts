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
    
    func addDeviceUnit(elementIndex:Int, 设备名称: String, 台数: Float, 每月开放天数: Float, 每天开放小时: Float) -> Void {
        let device = DeviceUnit(设备组名称: 设备名称, 台数: 台数, 每月开放天数: 每月开放天数, 每天开放小时: 每天开放小时)
        elements[elementIndex].deviceUnits.append(device)
    }
}
