//
//  DetailDoctor.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailDoctor: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int

    var body: some View {
        VStack {
            Text("小组名称")
            //@ViewBuilder
            List {
                Text("小组名称")
//                DetailItem(elementIndex:elementIndex,小组名称:"",项目名称:"")
//                DetailItem(elementIndex:elementIndex,小组名称:"",项目名称:"")
            }
            
        }
        
        
    }
}

//struct DetailDoctor_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailDoctor()
//    }
//}
