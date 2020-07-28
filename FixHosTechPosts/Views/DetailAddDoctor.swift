//
//  DetailAddDoctor.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailAddDoctor: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    @State var groupName: String = ""
    @State var comment = ""
    @State var items: [CheckItem] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("人员组名称",text: $groupName)
                    .hLabel(label: "人员组名称")
                TextField("备注",text: $comment)
                    .hLabel(label: "备注")
                
                Button(action: {
                    self.userData.addDoctorUnit(elementIndex: self.elementIndex, 人员组名称: self.groupName, 备注: self.comment)
                }) {
                    Text("新增人员组")
                }
            }
            
        }
        
        
    }
}

//struct DetailDoctor_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailDoctor()
//    }
//}
