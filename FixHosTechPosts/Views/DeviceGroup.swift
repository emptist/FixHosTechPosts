//
//  DeviceGroup.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/27.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI





struct DeviceGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView {
                DeviceUnits(elementIndex: self.elementIndex)
            }
            Spacer()
            Divider()
            
            Text("设备绑定技师医师和护士,根据所支持的设备分组").font(.body).foregroundColor(.red)
            DetailAddDevice(elementIndex: self.elementIndex, deviceName: "", numOfDevs: 0, openDaysPerMonth: 0, openHoursPerDay: 0, techsPerDevice: 0, nursesPerDevice: 0, doctorsPerDevice: 0, curerPerDevice: 0, securitryPerDevice: 0)
            
        }
    }
}

