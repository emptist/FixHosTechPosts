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
            ScrollView {
                VStack {
                    ForEach(userData.operatorUnitsAt(self.elementIndex)) { unit in
                        VStack(alignment:.leading) {
                            HStack {
                                Text("\(unit.操作组名称)").font(.body).foregroundColor(.purple)
                                //TextField("备注",text: $unit.备注)
                            }
                            Text("各操作组共需技师人数:\(self.userData.elements[self.elementIndex].各操作组共需技师人数)")
                            
                            OperateUnits(elementIndex:self.elementIndex,operatorUnit: unit)
                            Spacer()
                            Divider()
                            DetailAddItem(elementIndex: self.elementIndex, 操作组名称: unit.操作组名称, techsPerItem: 0, nursesPerItem: 0, doctorsPerItem: 0, curerPerItem: 0, securitryPerItem: 0)
                            Divider()
                        }
                        
                    }
                }
                
            }
            Spacer()
            Divider()
            Text("根据诊疗操作类型和项目分组,没有机器,或人手与机器数量无线性关系").font(.body).foregroundColor(.red)
            DetailAddOperationGroup(elementIndex: elementIndex)
        }
    }
}
