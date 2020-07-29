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
        VStack (alignment: .leading, spacing: 10) {
            
            DeptBase(elementIndex: self.elementIndex)
            Spacer()
            Divider() //Text("定编计算").font(.title)
            HStack(alignment: .center, spacing: 10) {
                Text("按设备分组各组合计").font(.body).foregroundColor(.purple)
                Text("技师 \(userData.elements[elementIndex].各设备组共需技师人数)")
                Text("护士 \(userData.elements[elementIndex].各设备组共需护士人数)")
                Text("医师 \(userData.elements[elementIndex].各设备组共需医师人数)")
                Text("治疗师 \(userData.elements[elementIndex].各设备组共需治疗师人数)")
                Text("文员 \(userData.elements[elementIndex].各设备组共需文员人数)")
            }
            //.font(.body)
            .foregroundColor(.blue)
            
        }
        
    }
    
}


struct DeptBase: View {
    @EnvironmentObject var userData: UserData
    var elementIndex: Int
    
    private var numberFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("",value: $userData.elements[self.elementIndex].开放床位数,formatter: numberFormatter).hLabel(label: "开放床位数")
                TextField("",value: $userData.elements[self.elementIndex].年出院人次数,formatter: numberFormatter).hLabel(label: "年出院人次数")
                TextField("",value: $userData.elements[self.elementIndex].管理及机动护士人数,formatter: numberFormatter).hLabel(label: "管理及机动护士人数")
                
                TextField("",value: $userData.elements[self.elementIndex].管理及机动技师人数,formatter: numberFormatter).hLabel(label: "管理及机动技师人数")
                TextField("",value: $userData.elements[self.elementIndex].管理及机动医师人数,formatter: numberFormatter).hLabel(label: "管理及机动医师人数")
            }
            HStack {
                
                TextField("",value: $userData.elements[self.elementIndex].管理及机动治疗师人数,formatter: numberFormatter).hLabel(label: "管理及机动治疗师人数")
                
                TextField("",value: $userData.elements[self.elementIndex].管理及机动文员人数,formatter: numberFormatter).hLabel(label: "管理及机动文员人数")
                TextField("",value: $userData.elements[self.elementIndex].每天技师应出勤小时,formatter: numberFormatter).hLabel(label: "每天技师应出勤小时")
                TextField("",value: $userData.elements[self.elementIndex].每天护士应出勤小时,formatter: numberFormatter).hLabel(label: "每天护士应出勤小时")
                TextField("",value: $userData.elements[self.elementIndex].每天医师应出勤小时,formatter: numberFormatter).hLabel(label: "每天医师应出勤小时")
                
            }
            HStack {
                
                TextField("",value: $userData.elements[self.elementIndex].每年技师人均应休假小时数,formatter: numberFormatter).hLabel(label: "每年技师应休假小时")
                TextField("",value: $userData.elements[self.elementIndex].每年护士人均应休假小时数,formatter: numberFormatter).hLabel(label: "每年护士应休假小时")
                TextField("",value: $userData.elements[self.elementIndex].每年医师人均应休假小时数,formatter: numberFormatter).hLabel(label: "每年医师应休假小时")
                
                TextField("",value: $userData.elements[self.elementIndex].每年治疗师人均应休假小时数,formatter: numberFormatter).hLabel(label: "每年治疗师人均应休假小时数")
                TextField("",value: $userData.elements[self.elementIndex].每年文员人均应休假小时数,formatter: numberFormatter).hLabel(label: "每年文员人均应休假小时数")
            }
            HStack {
                
                TextField("",value: $userData.elements[self.elementIndex].每年技师人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年技师人均其他非工作小时数")
                
                TextField("",value: $userData.elements[self.elementIndex].每年护士人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年护士人均其他非工作小时数")
                TextField("",value: $userData.elements[self.elementIndex].每年医师人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年医师人均其他非工作小时数")
                TextField("",value: $userData.elements[self.elementIndex].每年治疗师人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年治疗师人均其他非工作小时数")
                TextField("",value: $userData.elements[self.elementIndex].每年文员人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年文员人均其他非工作小时数")
            }
            HStack {
                TextField("",value: $userData.elements[self.elementIndex].法定每年工作日,formatter: numberFormatter).hLabel(label: "法定每年工作日")
                //Spacer()
                //                TextField("",value: $userData.elements[self.elementIndex].每年技师人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年技师人均其他非工作小时数")
                //                TextField("",value: $userData.elements[self.elementIndex].每年护士人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年护士人均其他非工作小时数")
                //                TextField("",value: $userData.elements[self.elementIndex].每年医师人均其他非工作小时数,formatter: numberFormatter).hLabel(label: "每年医师人均其他非工作小时数")
                //

            }
        }
    }
}
//struct Department_Previews: PreviewProvider {
//    static var previews: some View {
//        Department()
//    }
//}
