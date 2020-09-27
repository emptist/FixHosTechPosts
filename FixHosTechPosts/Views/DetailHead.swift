//
//  DetailHead.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailHead: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    var body: some View {
        HStack {
            ZStack {
                //TextField("科室名称", text: $userData.elements[self.elementIndex].科室名称)
                    //.font(.title)
                Text(userData.elements[self.elementIndex].科室名称)
                    .font(.title)
            }
            
            Button(action: {
                self.userData.elements[self.elementIndex]
                    .已经确认.toggle()
            }) {
                if userData.elements[self.elementIndex].isConfirmed {
                    Image("star-filled")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.green)
                        .accessibility(label: Text("Remove from favorites"))
                } else {
                    Image("star-empty")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                        .accessibility(label: Text("Add to favorites"))
                }
            }
            .frame(width: 20, height: 20)
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.userData.elements[self.elementIndex]
                    .护理已经确认.toggle()
            }) {
                if userData.elements[self.elementIndex].护理已经确认 {
                    Image("star-filled")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.orange)
                        .accessibility(label: Text("Remove from favorites"))
                } else {
                    Image("star-empty")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                        .accessibility(label: Text("Add to favorites"))
                }
            }
            .frame(width: 20, height: 20)
            .buttonStyle(PlainButtonStyle())
            
            HStack{
                VStack(alignment:.leading) {
                    Text("医生: 目前人数 \(self.userData.elements[self.elementIndex].目前医生人数) 拟定编 \(self.userData.elements[self.elementIndex].定编医师人数)")
                    
                    Text("技师: 目前人数 \(self.userData.elements[self.elementIndex].目前技师人数 ?? 0) 拟定编 \(self.userData.elements[self.elementIndex].定编技师人数)")
                    
                    Text("护士: 目前人数 \(self.userData.elements[self.elementIndex].目前护士人数) 拟定编 \(self.userData.elements[self.elementIndex].定编护士人数)")
                }
            }.foregroundColor(.blue)
            
        }
    }
}

//struct DetailHead_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailHead()
//    }
//}
