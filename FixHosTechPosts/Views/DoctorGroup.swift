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
        //Text("医师组")
        VStack(alignment:.leading) {
            Text("服务多台设备,医师和护士,根据所支持的检查项目分组")
            DetailAddDoctor(elementIndex: elementIndex)
            VStack {
                ForEach(userData.elements[self.elementIndex].doctorUnits) { unit in
                    Section(header:Text(unit.医师组名称)) {
                        VStack(alignment:.leading) {
                            //Text("\(unit.医师组名称)")
                            DetailAddItem(elementIndex: self.elementIndex, 医师组名称: unit.医师组名称, techsPerItem: 0, nursesPerItem: 0, doctorsPerItem: 0)
                            Divider()
                            CheckItems(doctorUnit: unit)
//                            ForEach(unit.checkItems) { checkItem in
//                                // MARK: Replace this .constant to let checkItem changeable
//                                CheckItemView(item: .constant(checkItem))
//                            }
                            
//                            ForEach(unit.checkItems) { item in
//                                Text("项目名称: \(item.项目名称) 所需分钟: \(item.每次所需分钟) 年总次数: \(item.年总次数) 配备技师数: \(item.配备技师数) 配备护士数: \(item.配备护士数) 配备医师数: \(item.配备医师数)")
//                            }
                        }
                    }
                }
            }
        }
    }
}
