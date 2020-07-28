//
//  DoctorGroup.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/27.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DoctorGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    var body: some View {
        //Text("人员组")
        VStack(alignment:.leading) {
            VStack {
                ForEach(userData.elements[self.elementIndex].doctorUnits) { unit in
                    Section(header:Text(unit.人员组名称)) {
                        VStack(alignment:.leading) {
                            //Text("\(unit.人员组名称)")
                            DetailAddItem(elementIndex: self.elementIndex, 人员组名称: unit.人员组名称, techsPerItem: 0, nursesPerItem: 0, doctorsPerItem: 0, curerPerItem: 0, securitryPerItem: 0)
                            Divider()
                            CheckItems(doctorUnit: unit)
                        }
                    }
                }
            }
            Spacer()
            Divider()
            Text("服务多台设备,医师和护士,根据所支持的检查项目分组")
            DetailAddDoctor(elementIndex: elementIndex)

        }
    }
}
