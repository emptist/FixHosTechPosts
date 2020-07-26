//
//  Element.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Element: Hashable, Codable, Identifiable {
    
    //abc
    var 备注: String = "" // 补充资料与特殊情形
 
    //def
    var 法定每年工作日: Float = 250
    
    //ghi
    var 管理及机动医师人数: Float?
    var 管理及机动护士人数: Float?
    
    //jkl
    var 开放床位数 : Float = 0
    var 科室名称: String
    var 类别: String = ""
    
    //mno
    var 每天技师应出勤小时: Float = 8
    var 每天治疗师应出勤小时: Float = 8
    var 每天医师应出勤小时: Float = 8
    var 每天护士应出勤小时: Float = 7
    var 目前护士人数: Float = 0
    var 目前技师人数: Float?
    var 目前医生人数: Float = 0
    var 目前治疗师人数: Float?
    
    //pqr
    var 全部设备 = [Instrument]()
    
    //stu
    var 上年度执业医师人数: Float?
    
    //vwx
    
    //yz
    var 已经确认 = false
    
    
    /// 算法
    //abc
    
    var category: String {
        return 类别
    }
    
    //def
    
    //ghi
    var id = UUID()
    var isConfirmed: Bool {
        已经确认
    }
    
    //jkl
    
    // mno
    var name: String {
        return 科室名称
    }
    
    //pqr
    var pinyin: String {
        return 科室名称.applyingTransform(.toLatin, reverse: false) ?? 科室名称
    }
    
    var 人数: Float {
        目前医生人数 + 目前护士人数 + (目前治疗师人数 ?? 0) + (目前技师人数 ?? 0)
    }
    
    //stu
    
    //vwx
    
    //yz
    
    
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case 门诊 = "门诊"
        case 急诊 = "急诊"
        case 病房 = "病房"
        case 医技 = "医技"
    }
    
}

