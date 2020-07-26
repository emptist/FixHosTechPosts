//
//  DetailDevice.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailDevice: View {
    var body: some View {
        HStack {
            Text("设备名称")
            Text("台数")
            Text("每月开放日数")
            Text("每天开放小时")
        }
    }
}

struct DetailDevice_Previews: PreviewProvider {
    static var previews: some View {
        DetailDevice()
    }
}
