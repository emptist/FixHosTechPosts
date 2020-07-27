//
//  DetailItem.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

// checkItem 检查项目,
struct DetailItem: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    var 医师组名称: String
    @State var itemName: String = ""
    @State var minutesPerCase: Float = 0
    @State var casesPerYear: Float = 0
    
    
    var body: some View {
        HStack {
            TextField("项目名称",text: $itemName).hLabel(label: "项目名称")
            TextField("每次所需分钟",value: $minutesPerCase, formatter: numberFormatter).hLabel(label: "每次所需分钟")
            TextField("年总次数",value: $casesPerYear, formatter: numberFormatter).hLabel(label: "年总次数")
            
            Button(action: {
                self.userData.addItem(elementIndex:self.elementIndex,医师组名称: self.医师组名称,项目名称: self.itemName, 每次所需分钟: self.minutesPerCase, 年总次数: self.casesPerYear)
            }) {
                Text("新增诊疗项目")
            }
        }
    }
}

//struct DetailItem_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailItem()
//    }
//}
