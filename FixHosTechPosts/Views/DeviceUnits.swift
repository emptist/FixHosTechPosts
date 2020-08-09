//
//  Devices.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/28.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DeviceUnits: View {
    
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    var body: some View {
        VStack {
            ForEach(userData.elements[elementIndex].deviceUnits) { unit in
                // MARK: AttributeGraph: cycle detected
                
                DeviceUnitView(elementIndex:self.elementIndex, unit: unit)
            }
        }
        
    }
    
}

struct DeviceUnitView: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    //@Binding
    var unit: DeviceUnit
    var idx: Int {
        userData.elements[elementIndex].deviceUnits.firstIndex(of: unit) ?? 0
    }
    
    var body: some View {
        HStack {
            //HStack{
            //                Button(action: {
            //                    self.userData.removeDeviceUnit(elementIndex: self.elementIndex, groupIndex: self.idx)
            //                }) {
            //                    TextField("设备组名称",text: $userData.elements[elementIndex].deviceUnits[idx].设备组名称)
            //                        .foregroundColor(.purple)
            //                        .hLabel(label: "组名")
            //
            //                }
            //Text(unit.设备组名称).font(.body).foregroundColor(.purple)
            TextField("设备组名称",text: $userData.elements[elementIndex].deviceUnits[idx].设备组名称)
                .foregroundColor(.purple)
                .hLabel(label: "组名")
            //
            TextField("",value: $userData.elements[elementIndex].deviceUnits[idx].台数,formatter: numberFormatter)
                .hLabel(label: "设备台数")
            TextField("每月开放天数",value: $userData.elements[elementIndex].deviceUnits[idx].每月开放天数,formatter: numberFormatter)
                .hLabel(label: "每月开放天数")
            TextField("每天开放小时",value: $userData.elements[elementIndex].deviceUnits[idx].每天开放小时,formatter: numberFormatter)
                .hLabel(label: "每天开放小时")
            //}
            //HStack{
            TextField("配备技师数",value: $userData.elements[elementIndex].deviceUnits[idx].配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $userData.elements[elementIndex].deviceUnits[idx].配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $userData.elements[elementIndex].deviceUnits[idx].配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $userData.elements[elementIndex].deviceUnits[idx].配备治疗师数,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $userData.elements[elementIndex].deviceUnits[idx].配备文员数,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            TextField("备注",text: $userData.elements[elementIndex].deviceUnits[idx].备注)
                .hLabel(label: "备注")
        }
    }
}
