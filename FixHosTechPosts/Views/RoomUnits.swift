//
//  RoomUnits.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/30.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct RoomUnits: View {
    
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    var body: some View {
        VStack {
            ForEach(userData.elements[elementIndex].roomUnits) { unit in
                // MARK: Replace this .constant to let unit changeable
                RoomUnitView(elementIndex: self.elementIndex, roomUnit: unit)
            }
        }
        
    }
    
}

struct RoomUnitView: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    //@Binding
    var roomUnit: RoomUnit
    var idx: Int {
        userData.elements[self.elementIndex].roomUnits.firstIndex(of: roomUnit) ?? 0
    }
    var body: some View {
        HStack {
            TextField("请输入",text: $userData.elements[self.elementIndex].roomUnits[self.idx].诊室组名称)
                .foregroundColor(.purple)
                .hLabel(label: "组名")
            //Text(roomUnit.诊室组名称).font(.body).foregroundColor(.purple)
            TextField("请输入",value: $userData.elements[self.elementIndex].roomUnits[self.idx].房间数,formatter: numberFormatter)
                .hLabel(label: "房间数")
            TextField("每月开放天数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].每月开放天数,formatter: numberFormatter)
                .hLabel(label: "每月开放天数")
            TextField("每天开放小时",value: $userData.elements[self.elementIndex].roomUnits[self.idx].每天开放小时,formatter: numberFormatter)
                .hLabel(label: "每天开放小时")
            TextField("配备技师数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].配备治疗师数,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $userData.elements[self.elementIndex].roomUnits[self.idx].配备文员数,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            TextField("备注",text: $userData.elements[self.elementIndex].roomUnits[self.idx].备注)
                .hLabel(label: "备注")
            
        }
        
    }
}
