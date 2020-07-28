//
//  DetailItem.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

// checkItem 检查项目,
struct DetailAddItem: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    var 医师组名称: String
    @State var itemName: String = ""
    @State var minutesPerCase: Float = 0
    @State var casesPerYear: Float = 0
    @State var techsPerItem: Float //= 0
    @State var nursesPerItem: Float //= 0
    @State var doctorsPerItem: Float //= 0
    @State var curerPerItem: Float //= 0
    @State var securitryPerItem: Float //= 0
    
    @State var comment = ""
    
    var body: some View {
        HStack {
            TextField("项目名称",text: $itemName).hLabel(label: "项目名称")
            TextField("每次所需分钟",value: $minutesPerCase, formatter: numberFormatter).hLabel(label: "每次所需分钟")
            TextField("年总次数",value: $casesPerYear, formatter: numberFormatter).hLabel(label: "年总次数")
            TextField("配备技师数",value: $techsPerItem,formatter: numberFormatter)
                .hLabel(label: "配备技师数")
            TextField("配备护士数",value: $nursesPerItem,formatter: numberFormatter)
                .hLabel(label: "配备护士数")
            TextField("配备医师数",value: $doctorsPerItem,formatter: numberFormatter)
                .hLabel(label: "配备医师数")
            TextField("配备治疗师数",value: $curerPerItem,formatter: numberFormatter)
                .hLabel(label: "配备治疗师数")
            TextField("配备文员数",value: $securitryPerItem,formatter: numberFormatter)
                .hLabel(label: "配备文员数")
            
            TextField("备注",text: $comment)
                .hLabel(label: "备注")
            
            Button(action: {
                self.userData.addItem(elementIndex:self.elementIndex,医师组名称: self.医师组名称,项目名称: self.itemName, 每次所需分钟: self.minutesPerCase, 年总次数: self.casesPerYear, 配备技师数: self.techsPerItem, 配备护士数: self.nursesPerItem, 配备医师数: self.doctorsPerItem,配备治疗师数:self.curerPerItem,配备文员数:self.securitryPerItem , 备注: self.comment)
            }) {
                Text("新增诊疗项目")
            }
        }
    }
}

//struct DetailItem_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailAddItem()
//    }
//}
