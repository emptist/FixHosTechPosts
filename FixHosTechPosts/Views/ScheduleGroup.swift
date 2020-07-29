//
//  ScheduleGroup.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/29.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ScheduleGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    var body: some View {
        Text("根据工作排班分组的定编计算方法 \(elementIndex)")
    }
}

