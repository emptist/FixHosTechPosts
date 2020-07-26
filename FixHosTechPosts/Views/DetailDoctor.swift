//
//  DetailDoctor.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct DetailDoctor: View {
    var body: some View {
        HStack {
            Text("小组名称")
            DetailItem()
            DetailItem()
            DetailItem()
        }
        
        
    }
}

struct DetailDoctor_Previews: PreviewProvider {
    static var previews: some View {
        DetailDoctor()
    }
}
