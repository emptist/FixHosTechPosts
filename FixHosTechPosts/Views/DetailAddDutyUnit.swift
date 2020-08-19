//
//  DetailAddDutyUnit.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/8/19.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailAddDutyUnit: View {
    @EnvironmentObject var userData: UserData
    @State var name: String = ""
    @State var comment: String = ""
    var elementIndex: Int
    
//    var element:Element
//    var elementIndex: Int {
//        userData.elements.firstIndex(where: { $0.id == element.id })!
//    }
    
    var body: some View {
        HStack {
            TextField("",text:$name).hLabel(label: "排班名称")
            TextField("备注",text: $comment)
                .hLabel(label: "备注")
            
            Button(action: {
                self.userData.addDutyGroup(self.name, at: self.elementIndex)//in: self.element)
            }, label: {Text("增加班次")})
        }
        
    }
}
/*
 import SwiftUI
 
 struct NurseAddGroup: View {
 @EnvironmentObject var userData: UserData
 @State var name: String = ""
 
 var element:Element
 var elementIndex: Int {
 userData.elements.firstIndex(where: { $0.id == element.id })!
 }
 
 var body: some View {
 HStack {
 TextField("",text:$name).hLabel(label: "排班名称")
 Button(action: {
 self.userData.addNurseGroup(self.name, at: self.elementIndex)//in: self.element)
 }, label: {Text("增加班次")})
 }
 }
 }

 */
//struct DetailAddDutyUnit_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailAddDutyUnit()
//    }
//}
