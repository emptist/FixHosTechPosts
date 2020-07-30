//
//  DetailAddRoom.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/30.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct DetailAddRoom: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    //    @Binding var roomName: String
    //    @Binding var numOfRooms: Float
    //    @Binding var openDaysPerMonth: Float
    //    @Binding var openHoursPerDay: Float
    @State var roomName: String //= ""
    @State var numOfRooms: Float //= 0
    @State var openDaysPerMonth: Float //= 0
    @State var openHoursPerDay: Float //= 0
    @State var techsPerRoom: Float //= 0
    @State var nursesPerRoom: Float //= 0
    @State var doctorsPerRoom: Float //= 0
    @State var curerPerRoom: Float //= 0
    @State var securitryPerRoom: Float //= 0
    
    @State var comment = ""
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing:2) {
            HStack {
                TextField("请输入",text:$roomName)
                    .hLabel(label: "诊室组名称")
                TextField("请输入",value: $numOfRooms,formatter: numberFormatter)
                    .hLabel(label: "房间数")
                TextField("每月开放天数",value: $openDaysPerMonth,formatter: numberFormatter)
                    .hLabel(label: "每月开放天数")
                TextField("每天开放小时",value: $openHoursPerDay,formatter: numberFormatter)
                    .hLabel(label: "每天开放小时")
                TextField("配备技师数",value: $techsPerRoom,formatter: numberFormatter)
                    .hLabel(label: "配备技师数")
                TextField("配备护士数",value: $nursesPerRoom,formatter: numberFormatter)
                    .hLabel(label: "配备护士数")
                
                
                TextField("配备医师数",value: $doctorsPerRoom,formatter: numberFormatter)
                    .hLabel(label: "配备医师数")
                TextField("配备治疗师数",value: $curerPerRoom,formatter: numberFormatter)
                    .hLabel(label: "配备治疗师数")
                TextField("配备文员数",value: $securitryPerRoom,formatter: numberFormatter)
                    .hLabel(label: "配备文员数")
                TextField("备注",text: $comment)
                    .hLabel(label: "备注")
            }
            Button(action: {
                self.userData.addRoomUnit(elementIndex:self.elementIndex,诊室名称: self.roomName, 房间数: self.numOfRooms, 每月开放天数: self.openDaysPerMonth, 每天开放小时: self.openHoursPerDay,配备技师数:self.techsPerRoom,配备护士数:self.nursesPerRoom,配备医师数:self.doctorsPerRoom, 配备治疗师数: self.curerPerRoom, 配备文员数: self.securitryPerRoom, 备注: self.comment)
            }) {
                Text("新增诊室组")
            }
            
        }//.foregroundColor(.blue)
    }
    
}


