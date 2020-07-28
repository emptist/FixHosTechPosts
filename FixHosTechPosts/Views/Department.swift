//
//  Department.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/28.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct Department: View {
    @EnvironmentObject var userData: UserData
    
    var elementIndex: Int
    private var numberFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }
    
    var body: some View {
        VStack {
            Text("各设备组共需技师人数 \(userData.elements[elementIndex].各设备组共需技师人数)")
            Text("各设备组共需护士人数 \(userData.elements[elementIndex].各设备组共需护士人数)")
            Text("各设备组共需医师人数 \(userData.elements[elementIndex].各设备组共需医师人数)")
        }
    }
}
struct Department_Previews: PreviewProvider {
    static var previews: some View {
        Department()
    }
}
