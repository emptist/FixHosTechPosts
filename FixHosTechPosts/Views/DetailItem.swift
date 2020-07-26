//
//  DetailItem.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailItem: View {
    var body: some View {
        HStack {
            Text("项目名称")
            Text("每次所需分钟")
            Text("年总次数")
        }
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem()
    }
}
