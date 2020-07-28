//
//  DetailAddDoctor.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailAddDoctor: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    @State var groupName: String = ""
    @State var items: [CheckItem] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("医师组名称",text: $groupName)
                Button(action: {
                    self.userData.addDoctorUnit(elementIndex: self.elementIndex, 医师组名称: self.groupName)//(elementIndex:self.elementIndex,设备名称: self.deviceName, 台数: self.numOfDevs, 每月开放天数: self.openDaysPerMonth, 每天开放小时: self.openHoursPerDay)
                }) {
                    Text("新增医师组")
                }
            }
            
        }
        
        
    }
}

//struct DetailDoctor_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailDoctor()
//    }
//}
