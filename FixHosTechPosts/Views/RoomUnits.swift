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
                RoomUnitView(roomUnit: .constant(unit))
            }
        }
        
    }
    
}

struct RoomUnitView: View {
    @Binding var roomUnit: RoomUnit
    var body: some View {
        HStack {
            Text(roomUnit.诊室组名称).font(.body).foregroundColor(.purple)
            TextField("请输入",value: $roomUnit.房间数,formatter: numberFormatter)
                .hLabel(label: "房间数")
            TextField("每月开放天数",value: $roomUnit.每月开放天数,formatter: numberFormatter)
                .hLabel(label: "每月开放天数")
            TextField("每天开放小时",value: $roomUnit.每天开放小时,formatter: numberFormatter)
                .hLabel(label: "每天开放小时")
            TextField("配备技师数",value: $roomUnit.配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $roomUnit.配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $roomUnit.配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $roomUnit.配备治疗师数,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $roomUnit.配备文员数,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            TextField("备注",text: $roomUnit.备注)
                .hLabel(label: "备注")
            
        }
        
    }
}
