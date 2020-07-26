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
    var element:Element
    var elementIndex: Int {
        userData.elements.firstIndex(where: { $0.id == element.id })!
    }
    
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
            
        }
    }
}

//struct DetailHead_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailHead()
//    }
//}
