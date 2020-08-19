//
//  DutyUnits.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/8/14.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI
struct DutyUnits: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    var body: some View {
        VStack {
            ForEach(userData.elements[elementIndex].dutyGroups) { group in
                DutyUnitView(elementIndex: self.elementIndex, dutyGroup: group)
            }
        }
    }
}



struct DutyUnitView: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    //@Binding
    var dutyGroup: DutyGroup
    var idx: Int {
        userData.elements[self.elementIndex].dutyGroups.firstIndex(of: dutyGroup) ?? 0
    }
    var body: some View {
        HStack {
            TextField("请输入",text: $userData.elements[self.elementIndex].dutyGroups[self.idx].name)
                .foregroundColor(.purple)
                .hLabel(label: "组名")
            //Text(dutyGroup.诊室组名称).font(.body).foregroundColor(.purple)
            TextField("请输入",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].在班小时数,formatter: numberFormatter)
                .hLabel(label: "在班小时数")
            TextField("每周排班天数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].每周排班天数,formatter: numberFormatter)
                .hLabel(label: "每周排班天数")
//            TextField("每天开放小时",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].,formatter: numberFormatter)
//                .hLabel(label: "每天开放小时")
            TextField("配备技师数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].配备治疗师数,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $userData.elements[self.elementIndex].dutyGroups[self.idx].配备文员数,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            TextField("备注",text: $userData.elements[self.elementIndex].dutyGroups[self.idx].备注)
                .hLabel(label: "备注")
            
        }
        
    }
}

