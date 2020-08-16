//
//  OperateUnits.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/28.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct OperateUnits: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    //@Binding
    var operatorUnit: OperatorUnit
    
    var body: some View {
        VStack {
            //ForEach(userData.elements[elementIndex].operatorUnits) { operatorUnit in
                ForEach(operatorUnit.checkItems) { checkItem in
                    OperateUnitView(elementIndex:self.elementIndex,operatorUnit:self.operatorUnit, item: checkItem)
                }
            //}
            
        }
        
    }
}

struct OperateUnitView: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    var operatorUnit: OperatorUnit
    //@Binding
    var item: CheckItem
    var operateIdx: Int {
        userData.elements[elementIndex].operatorUnits.firstIndex(of: operatorUnit) ?? 0
    }
    var idx: Int {
        userData.elements[elementIndex].operatorUnits[operateIdx].checkItems.firstIndex(of:item) ?? 0
    }
    var body: some View {
        HStack{
            TextField("项目名称",text: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].项目名称)
                .foregroundColor(.purple)
                .hLabel(label: "组名")
            TextField("每次所需分钟",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].每次所需分钟, formatter: numberFormatter).hLabel(label: "每次所需分钟")
            TextField("年总次数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].年总次数, formatter: numberFormatter).hLabel(label: "年总次数")
            TextField("配备技师数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].配备技师数,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].配备护士数,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].配备医师数,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].配备治疗师数,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].配备文员数,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            TextField("备注",text: $userData.elements[elementIndex].operatorUnits[operateIdx].checkItems[idx].备注)
                .hLabel(label: "备注")
            
        }
    }
}
//
//struct CheckItems_Previews: PreviewProvider {
//    static var previews: some View {
//        OperateUnits()
//    }
//}
