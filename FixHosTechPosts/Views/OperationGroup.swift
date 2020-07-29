//
//  OperationGroup.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/27.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct OperationGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    var body: some View {
        //Text("操作组")
        VStack(alignment:.leading) {
            VStack {
                ForEach(userData.operatorUnitsAt(self.elementIndex)) { unit in
                    VStack(alignment:.leading) {
                        Text("\(unit.操作组名称)").font(.body).foregroundColor(.purple)
                        CheckItems(operatorUnit: unit)
                        Spacer()
                        Divider()
                        DetailAddItem(elementIndex: self.elementIndex, 操作组名称: unit.操作组名称, techsPerItem: 0, nursesPerItem: 0, doctorsPerItem: 0, curerPerItem: 0, securitryPerItem: 0)
                        Divider()
                    }
                
                }
            }
            Spacer()
            Divider()
            Text("服务多台设备,医师和护士,根据所支持的检查项目分组")
            DetailAddOperationGroup(elementIndex: elementIndex)

        }
    }
}
