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
            TextField("机器技师比",value: $techsPerDevice,formatter: numberFormatter)
                .hLabel(label: "机器技师比")
            TextField("机器护士比",value: $nursesPerDevice,formatter: numberFormatter)
                .hLabel(label: "机器护士比")
            TextField("机器医师比",value: $doctorsPerDevice,formatter: numberFormatter)
                .hLabel(label: "机器医师比")
            
            Button(action: {
                self.userData.addDeviceUnit(elementIndex:self.elementIndex,设备名称: self.deviceName, 台数: self.numOfDevs, 每月开放天数: self.openDaysPerMonth, 每天开放小时: self.openHoursPerDay,机器技师比:self.techsPerDevice,机器护士比:self.nursesPerDevice,机器医师比:self.doctorsPerDevice)
            }) {
                Text("新增设备组")
            }
        }
        
    }
}

//struct DetailDevice_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailDevice()
//    }
//}
