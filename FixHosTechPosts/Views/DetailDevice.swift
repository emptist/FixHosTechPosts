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
            
            Button(action: {
                self.userData.addDeviceUnit(elementIndex:self.elementIndex,设备名称: self.deviceName, 台数: self.numOfDevs, 每月开放天数: self.openDaysPerMonth, 每天开放小时: self.openHoursPerDay)
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
