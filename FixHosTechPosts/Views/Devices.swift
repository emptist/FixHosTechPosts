//
//  Devices.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/28.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct Devices: View {
    
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    var body: some View {
        VStack {
            ForEach(userData.elements[elementIndex].deviceUnits) { unit in
                // MARK: Replace this .constant to let unit changeable
                DeviceView(deviceUnit: .constant(unit))
            }
        }
        
    }
    
}

struct DeviceView: View {
    @Binding var deviceUnit: DeviceUnit
    var body: some View {
        HStack {
            Text(deviceUnit.设备组名称)
            TextField("请输入",value: $deviceUnit.台数,formatter: numberFormatter)
                .hLabel(label: "台数")
            TextField("每月开放天数",value: $deviceUnit.每月开放天数,formatter: numberFormatter)
                .hLabel(label: "每月开放天数")
            TextField("每天开放小时",value: $deviceUnit.每天开放小时,formatter: numberFormatter)
                .hLabel(label: "每天开放小时")
            TextField("配备技师数",value: $deviceUnit.配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $deviceUnit.配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $deviceUnit.配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            
        }
    
    }
}
