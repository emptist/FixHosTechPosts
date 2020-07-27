//
//  Element.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI
import CoreLocation



struct DeviceUnit: Codable, Equatable, Hashable, Identifiable {
    var id: String {
        设备组名称
    }
    var 设备组名称: String
    var 台数: Float
    var 每月开放天数: Float
    var 每天开放小时: Float
    var 配备技师数: Float //= 1
    var 配备护士数: Float //= 0.2
    var 配备医师数: Float //= 0
    
    var 每年开放小时数: Float {
        每天开放小时 * 每月开放天数 * 12
    }
    
    var 每年配备技师总工时: Float {
        每年开放小时数 * 配备技师数
    }
}

struct DoctorUnit: Codable, Equatable, Hashable, Identifiable {
    var id: String {
        医师组名称
    }
    var 医师组名称: String
    var checkItems: Array<CheckItem>
}

struct CheckItem: Codable, Equatable, Hashable, Identifiable {
    var id: String {
        项目名称
    } //= UUID()
    var 项目名称: String
    var 每次所需分钟: Float
    var 年总次数: Float
}

struct Element: Codable, Equatable, Hashable, Identifiable {
    
    //abc
    var 备注: String = "" // 补充资料与特殊情形
 
    //def
    var deviceUnits: Array<DeviceUnit> = []
    var doctorUnits: Array<DoctorUnit> = []
    
    var 法定每年工作日: Float = 250
    
    //ghi
    var 管理及机动医师人数: Float?
    var 管理及机动护士人数: Float?
    
    //jkl
    var 开放床位数: Float = 0
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
    
    
    
    
}

