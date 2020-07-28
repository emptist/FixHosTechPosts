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
            Text("设备绑定技师医师和护士,根据所支持的设备分组")
            DetailDevice(elementIndex: elementIndex)
            Divider()
            ForEach(userData.elements[self.elementIndex].deviceUnits) { unit in
                //Text(unit.设备名称)
                HStack {
                    Text("设备组名称:\(unit.设备组名称) 台数: \(unit.台数) 每天开放小时: \(unit.每天开放小时) 每月开放天数: \(unit.每月开放天数) 绑定技师数: \(unit.配备技师数) 绑定护士数: \(unit.配备护士数) 绑定医师数: \(unit.配备医师数)")
            
                }}
            
        }
    }
}

