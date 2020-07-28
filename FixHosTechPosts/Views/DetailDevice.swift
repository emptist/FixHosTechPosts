//
//  DetailDevice.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailDevice: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
//    @Binding var deviceName: String
//    @Binding var numOfDevs: Float
//    @Binding var openDaysPerMonth: Float
//    @Binding var openHoursPerDay: Float
    @State var deviceName: String = ""
    @State var numOfDevs: Float = 0
    @State var openDaysPerMonth: Float = 0
    @State var openHoursPerDay: Float = 0
    @State var techsPerDevice: Float = 0
    @State var nursesPerDevice: Float = 0
    @State var doctorsPerDevice: Float = 0

    var body: some View {
        HStack {
            TextField("请输入",text:$deviceName)
                .hLabel(label: "设备组名称")
            TextField("请输入",value: $numOfDevs,formatter: numberFormatter)
                .hLabel(label: "台数")
            TextField("每月开放天数",value: $openDaysPerMonth,formatter: numberFormatter)
                .hLabel(label: "每月开放天数")
            TextField("每天开放小时",value: $openHoursPerDay,formatter: numberFormatter)
                .hLabel(label: "每天开放小时")
            TextField("配备技师数",value: $techsPerDevice,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $nursesPerDevice,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $doctorsPerDevice,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            
            Button(action: {
                self.userData.addDeviceUnit(elementIndex:self.elementIndex,设备名称: self.deviceName, 台数: self.numOfDevs, 每月开放天数: self.openDaysPerMonth, 每天开放小时: self.openHoursPerDay,配备技师数:self.techsPerDevice,配备护士数:self.nursesPerDevice,配备医师数:self.doctorsPerDevice)
            }) {
                Text("新增设备组")
            }
        }
        
    }
}

