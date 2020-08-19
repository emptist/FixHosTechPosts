//
//  DutyGroupView.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/29.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DutyGroupView: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView {
                //Text("根据工作排班分组的定编计算方法 \(elementIndex)")
                DutyUnits(elementIndex: self.elementIndex)
            }
            Spacer()
            
            Divider()
            Text("根据排班及时长分组,配备医技护等人员").font(.body).foregroundColor(.red)
            DetailAddDutyUnit(elementIndex: elementIndex)
        }
    }
}

