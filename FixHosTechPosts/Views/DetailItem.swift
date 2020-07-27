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
    var 小组名称: String
    var 项目名称: String
//    var numberFormatter: NumberFormatter {
//        let f = NumberFormatter()
//        f.numberStyle = .decimal
//        return f
//    }
    
    var body: some View {
        HStack {
            Text("项目名称")
//            TextField("每次所需分钟",value: $userData.elements[elementIndex].doctorUnits[小组名称][项目名称].每次所需分钟,formatter: numberFormatter)
            Text("年总次数")
        }
    }
}

//struct DetailItem_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailItem()
//    }
//}
