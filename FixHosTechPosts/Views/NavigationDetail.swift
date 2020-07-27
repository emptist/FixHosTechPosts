//
//  NavigationDetail.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationDetail: View {
    @EnvironmentObject var userData: UserData
    
    var element:Element
    var elementIndex: Int {
        userData.elements.firstIndex(where: { $0.id == element.id })!
    }
    private var numberFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    DetailHead(elementIndex:elementIndex)
                }
                Form {
                    // 根据开放时间分组
                    Section(header: Text("设备组").font(.headline).foregroundColor(.purple)) {
                        DeviceGroup(elementIndex: elementIndex)
                    }
                    
                    // 服务多台设备,医师和护士,根据所支持的检查项目分组
                    Section(header: Text("医师组").font(.headline).foregroundColor(.purple)) {
                        Text("服务多台设备,医师和护士,根据所支持的检查项目分组")
                        Button(action: {
                            self.userData.addDeviceUnit(elementIndex:self.elementIndex,设备名称: "", 台数: 0, 每月开放天数: 0, 每天开放小时: 0)
                        }) {
                            Text("新增医师组")
                        }
                        //                        DetailDoctor(elementIndex:elementIndex)
                        //                        DetailDoctor(elementIndex:elementIndex)
                        //                        DetailDoctor(elementIndex:elementIndex)
                    }
                    
                    //                    Section(header: Text("检查项目").font(.headline).foregroundColor(.purple)) {
                    //                        Text("hlll")
                    //                    }
                    
                }
                
            }.padding()
                .frame(maxWidth: 1300)
                .offset(x: 0, y: -1)
            
        }
    }
}

struct DeviceGroup: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    
    
    var body: some View {
        
        VStack(alignment:.leading) {
            Text("服务多台设备,医师和护士,根据所支持的检查项目分组")
            DetailDevice(elementIndex: elementIndex)
            
            ForEach(userData.elements[self.elementIndex].deviceUnits) { unit in
                //Text(unit.设备名称)
                HStack {
                    Text("设备组名称:\(unit.设备组名称) 台数: \(unit.台数) 每天开放小时: \(unit.每天开放小时) 每月开放天数: \(unit.每月开放天数)")
                    
                }}
            
        }
    }
}




struct NavigationDetail_Preview: PreviewProvider {
    static var previews: some View {
        NavigationDetail(element: elementData[0]).environmentObject(UserData())
    }
}
