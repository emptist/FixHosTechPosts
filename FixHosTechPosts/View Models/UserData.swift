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
    
    func addDeviceUnit(elementIndex:Int, 设备名称: String, 台数: Float, 每月开放天数: Float, 每天开放小时: Float,配备技师数:Float,配备护士数: Float, 配备医师数: Float,配备治疗师数: Float, 配备文员数: Float, 备注: String) -> Void {
        var device = DeviceUnit(设备组名称: 设备名称, 台数: 台数, 每月开放天数: 每月开放天数, 每天开放小时: 每天开放小时,配备技师数:配备技师数,配备护士数: 配备护士数, 配备医师数: 配备医师数, 配备治疗师数: 配备治疗师数, 配备文员数: 配备文员数)
        device.备注 = 备注
        elements[elementIndex].deviceUnits.append(device)
    }
    
    func addDoctorUnit(elementIndex: Int, 医师组名称: String, 备注: String) -> Void {
        var doctorUnit = DoctorUnit(医师组名称: 医师组名称, checkItems: [])
        doctorUnit.备注 = 备注
        elements[elementIndex].doctorUnits.append(doctorUnit)
    }
    
    func addItem(elementIndex: Int, 医师组名称: String, 项目名称: String, 每次所需分钟: Float, 年总次数: Float, 配备技师数:Float, 配备护士数: Float, 配备医师数: Float,配备治疗师数: Float, 配备文员数: Float, 备注: String) -> Void {
        var item = CheckItem(项目名称: 项目名称, 每次所需分钟: 每次所需分钟, 年总次数: 年总次数,配备技师数:配备技师数,配备护士数: 配备护士数, 配备医师数: 配备医师数, 配备治疗师数: 配备治疗师数, 配备文员数: 配备文员数)
        item.备注 = 备注
        print(item)
        guard let doctorUnitIndex = elements[elementIndex].doctorUnits.firstIndex(where: {unit in unit.医师组名称 == 医师组名称}) else {return}
        elements[elementIndex].doctorUnits[doctorUnitIndex].checkItems.append(item)
    }
}
