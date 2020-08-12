//
//  RoomGroup.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/30.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct RoomGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    
    var body: some View {
        
        VStack(alignment:.leading) {
            ScrollView {
                RoomUnits(elementIndex: self.elementIndex)
                
            }
            Spacer()
            
            Divider()
            
            Text("设备绑定技师医师和护士,根据所支持的设备分组").font(.body).foregroundColor(.red)
            DetailAddRoom(elementIndex: self.elementIndex, roomName: "", numOfRooms: 0, openDaysPerMonth: 0, openHoursPerDay: 0, techsPerRoom: 0, nursesPerRoom: 0, doctorsPerRoom: 0, curerPerRoom: 0, securitryPerRoom: 0)
            

        }
    }
}
