//
//  Element.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct RoomUnit: Codable, Equatable, Hashable, Identifiable {
    var id: String {
        诊室组名称
    }
    var 诊室组名称: String
    var 房间数: Float
    var 每月开放天数: Float
    var 每天开放小时: Float
    var 配备技师数: Float //= 1
    var 配备护士数: Float //= 0.2
    var 配备医师数: Float //= 0
    var 配备治疗师数: Float
    var 配备文员数: Float
    
    var 每年开放小时数: Float {
        每天开放小时 * 每月开放天数 * 12
    }
    
    var 配备技师每年总工时: Float {
        每年开放小时数 * 配备技师数
    }
    var 配备护士每年总工时: Float {
        每年开放小时数 * 配备护士数
    }
    var 配备医师每年总工时: Float {
        每年开放小时数 * 配备医师数
    }
    var 配备治疗师每年总工时: Float {
        每年开放小时数 * 配备治疗师数
    }
    var 配备文员每年总工时: Float {
        每年开放小时数 * 配备文员数
    }
    func 该组需要技师人数(_ 每位技师每年应出勤小时数: Float) -> Float {
        配备技师每年总工时 / 每位技师每年应出勤小时数
    }
    func 该组需要护士人数(_ 每位护士每年应出勤小时数: Float) -> Float {
        配备护士每年总工时 / 每位护士每年应出勤小时数
    }
    func 该组需要医师人数(_ 每位医师每年应出勤小时数: Float) -> Float {
        配备医师每年总工时 / 每位医师每年应出勤小时数
    }
    func 该组需要治疗师人数(_ 每位治疗师每年应出勤小时数: Float) -> Float {
        配备治疗师每年总工时 / 每位治疗师每年应出勤小时数
    }
    func 该组需要文员人数(_ 每位文员每年应出勤小时数: Float) -> Float {
        配备文员每年总工时 / 每位文员每年应出勤小时数
    }
    var 备注: String = "人室绑定"
}

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
    var 配备治疗师数: Float
    var 配备文员数: Float
    
    var 每年开放小时数: Float {
        每天开放小时 * 每月开放天数 * 12
    }
    
    var 配备技师每年总工时: Float {
        每年开放小时数 * 配备技师数
    }
    var 配备护士每年总工时: Float {
        每年开放小时数 * 配备护士数
    }
    var 配备医师每年总工时: Float {
        每年开放小时数 * 配备医师数
    }
    var 配备治疗师每年总工时: Float {
        每年开放小时数 * 配备治疗师数
    }
    var 配备文员每年总工时: Float {
        每年开放小时数 * 配备文员数
    }
    func 该组需要技师人数(_ 每位技师每年应出勤小时数: Float) -> Float {
        配备技师每年总工时 / 每位技师每年应出勤小时数
    }
    func 该组需要护士人数(_ 每位护士每年应出勤小时数: Float) -> Float {
        配备护士每年总工时 / 每位护士每年应出勤小时数
    }
    func 该组需要医师人数(_ 每位医师每年应出勤小时数: Float) -> Float {
        配备医师每年总工时 / 每位医师每年应出勤小时数
    }
    func 该组需要治疗师人数(_ 每位治疗师每年应出勤小时数: Float) -> Float {
        配备治疗师每年总工时 / 每位治疗师每年应出勤小时数
    }
    func 该组需要文员人数(_ 每位文员每年应出勤小时数: Float) -> Float {
        配备文员每年总工时 / 每位文员每年应出勤小时数
    }
    var 备注: String = "人机绑定"
}

struct OperatorUnit: Codable, Equatable, Hashable, Identifiable {
    var id: String {
        操作组名称
    }
    var 操作组名称: String
    var checkItems: Array<CheckItem>
   
    var 配备技师数: Float {
        var x: Float = 0
        for item in checkItems {
            x += item.配备技师数
        }
        return x
    }
    var 配备护士数: Float {
        var x: Float = 0
        for item in checkItems {
            x += item.配备护士数
        }
        return x
    }
    var 配备医师数: Float {
        var x: Float = 0
        for item in checkItems {
            x += item.配备医师数
        }
        return x
    }
    var 配备治疗师数: Float {
        var x: Float = 0
        for item in checkItems {
            x += item.配备治疗师数
        }
        return x
    }
    var 配备文员数: Float {
        var x: Float = 0
        for item in checkItems {
            x += item.配备文员数
        }
        return x
    }
    
    var 配备技师每年总工时: Float {
        每年操作小时数 * 配备技师数
    }
    var 配备护士每年总工时: Float {
        每年操作小时数 * 配备护士数
    }
    var 配备医师每年总工时: Float {
        每年操作小时数 * 配备医师数
    }
    var 配备治疗师每年总工时: Float {
        每年操作小时数 * 配备治疗师数
    }
    var 配备文员每年总工时: Float {
        每年操作小时数 * 配备文员数
    }

    
    func 该组需要技师人数(_ 每位技师每年应出勤小时数: Float) -> Float {
        配备技师每年总工时 / 每位技师每年应出勤小时数
    }
    func 该组需要护士人数(_ 每位护士每年应出勤小时数: Float) -> Float {
        配备护士每年总工时 / 每位护士每年应出勤小时数
    }
    func 该组需要医师人数(_ 每位医师每年应出勤小时数: Float) -> Float {
        配备医师每年总工时 / 每位医师每年应出勤小时数
    }
    func 该组需要治疗师人数(_ 每位治疗师每年应出勤小时数: Float) -> Float {
        配备治疗师每年总工时 / 每位治疗师每年应出勤小时数
    }
    func 该组需要文员人数(_ 每位文员每年应出勤小时数: Float) -> Float {
        配备文员每年总工时 / 每位文员每年应出勤小时数
    }
    
    var 每年操作小时数: Float {
        10
    }
    var 备注: String = ""
}

struct CheckItem: Codable, Equatable, Hashable, Identifiable {
    
    var id: String {
        项目名称
    } //= UUID()
    var 项目名称: String
    var 每次所需分钟: Float
    var 年总次数: Float
    var 配备技师数: Float //= 1
    var 配备护士数: Float //= 0.2
    var 配备医师数: Float //= 0
    var 配备治疗师数: Float
    var 配备文员数: Float
    var 备注: String = "人机不绑定"
    
}

struct Element: Codable, Equatable, Hashable, Identifiable {
    
    //abc
    var 备注: String = "" // 补充资料与特殊情形
    
    //def
    var deviceUnits: Array<DeviceUnit> = []
    var operatorUnits: Array<OperatorUnit> = []
    var roomUnits: Array<RoomUnit> = []
    
    var 法定每年工作日: Float = 250
    
    //ghi
    var 管理及机动技师人数: Float?
    var 管理及机动医师人数: Float?
    var 管理及机动护士人数: Float?
    var 管理及机动治疗师人数: Float?
    var 管理及机动文员人数: Float?
    
    //jkl
    var 开放床位数: Float = 0
    var 科室名称: String
    var 类别: String = ""
    
    //mno
    var 每年护士人均应休假小时数: Float = 35
    var 每年护士人均其他非工作小时数: Float = 15
    var 每年医师人均应休假小时数: Float = 60
    var 每年医师人均其他非工作小时数: Float = 20
    var 每年技师人均应休假小时数: Float = 60
    var 每年技师人均其他非工作小时数: Float = 20
    var 每年治疗师人均应休假小时数: Float = 60
    var 每年治疗师人均其他非工作小时数: Float = 20
    var 每年文员人均应休假小时数: Float = 35
    var 每年文员人均其他非工作小时数: Float = 15
    
    var 每天技师应出勤小时: Float = 8
    var 每天治疗师应出勤小时: Float = 8
    var 每天医师应出勤小时: Float = 8
    var 每天护士应出勤小时: Float = 7
    var 每天文员应出勤小时: Float = 7
    
    var 目前护士人数: Float = 0
    var 目前技师人数: Float?
    var 目前医生人数: Float = 0
    var 目前治疗师人数: Float?
    var 目前文员人数: Float?
    
    var 年出院人次数: Float = 0
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
    var 定编技师人数: Float {
        各操作组共需技师人数 + 各设备组共需技师人数 + 各诊室组共需技师人数
    }
    var 定编护士人数: Float {
        各操作组共需护士人数 + 各设备组共需护士人数 + 各诊室组共需护士人数
    }
    var 定编医师人数: Float {
        各操作组共需医师人数 + 各设备组共需医师人数 + 各诊室组共需医师人数
    }
    var 定编治疗师人数: Float {
        各操作组共需治疗师人数 + 各设备组共需治疗师人数 + 各诊室组共需治疗师人数
    }
    var 定编文员人数: Float {
        各操作组共需文员人数 + 各设备组共需文员人数 + 各诊室组共需文员人数
    }
    var 定编人数: Float {
        定编技师人数 + 定编护士人数 + 定编医师人数 + 定编治疗师人数 + 定编文员人数
    }
    //ghi
    
    var 各操作组共需医师人数: Float {
        var n:Float = 0
        for each in operatorUnits {
            n += each.该组需要医师人数(每位医师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各操作组共需护士人数: Float {
        var n:Float = 0
        for each in operatorUnits {
            n += each.该组需要护士人数(每位护士每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各操作组共需技师人数: Float {
        var n:Float = 0
        for each in operatorUnits {
            n += each.该组需要技师人数(每位技师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各操作组共需治疗师人数: Float {
        var n:Float = 0
        for each in operatorUnits {
            n += each.该组需要治疗师人数(每位治疗师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各操作组共需文员人数: Float {
        var n:Float = 0
        for each in operatorUnits {
            n += each.该组需要文员人数(每位文员每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各设备组共需医师人数: Float {
        var n:Float = 0
        for each in deviceUnits {
            n += each.该组需要医师人数(每位医师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各设备组共需护士人数: Float {
        var n:Float = 0
        for each in deviceUnits {
            n += each.该组需要护士人数(每位护士每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各设备组共需技师人数: Float {
        var n:Float = 0
        for each in deviceUnits {
            n += each.该组需要技师人数(每位技师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各设备组共需治疗师人数: Float {
        var n:Float = 0
        for each in deviceUnits {
            n += each.该组需要治疗师人数(每位治疗师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各设备组共需文员人数: Float {
        var n:Float = 0
        for each in deviceUnits {
            n += each.该组需要文员人数(每位文员每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各诊室组共需医师人数: Float {
        var n:Float = 0
        for each in roomUnits {
            n += each.该组需要医师人数(每位医师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各诊室组共需护士人数: Float {
        var n:Float = 0
        for each in roomUnits {
            n += each.该组需要护士人数(每位护士每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各诊室组共需技师人数: Float {
        var n:Float = 0
        for each in roomUnits {
            n += each.该组需要技师人数(每位技师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各诊室组共需治疗师人数: Float {
        var n:Float = 0
        for each in roomUnits {
            n += each.该组需要治疗师人数(每位治疗师每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var 各诊室组共需文员人数: Float {
        var n:Float = 0
        for each in roomUnits {
            n += each.该组需要文员人数(每位文员每年实际出勤总工时).rounded(.awayFromZero)
        }
        return n
    }
    
    var id = UUID()
    var isConfirmed: Bool {
        已经确认
    }
    
    //jkl
    
    // mno
    var 每位护士每年实际出勤总工时: Float {
        每位护士每年应出勤总工时 - 每年预估护士人均休假小时
    }
    var 每位护士每年应出勤总工时: Float {
        法定每年工作日 * 每天护士应出勤小时
    }
    var 每位医师每年实际出勤总工时: Float {
        每位医师每年应出勤总工时 - 每年预估医师人均休假小时
    }
    var 每位医师每年应出勤总工时: Float {
        法定每年工作日 * 每天医师应出勤小时
    }
    var 每位技师每年实际出勤总工时: Float {
        每位技师每年应出勤总工时 - 每年预估技师人均休假小时
    }
    var 每位技师每年应出勤总工时: Float {
        法定每年工作日 * 每天技师应出勤小时
    }
    var 每位治疗师每年应出勤总工时: Float {
        法定每年工作日 * 每天治疗师应出勤小时
    }
    var 每位治疗师每年实际出勤总工时: Float {
        每位治疗师每年应出勤总工时 - 每年预估治疗师人均休假小时
    }
    var 每位文员每年应出勤总工时: Float {
        法定每年工作日 * 每天文员应出勤小时
    }
    var 每位文员每年实际出勤总工时: Float {
        每位文员每年应出勤总工时 - 每年预估文员人均休假小时
    }
    
    //    var 每位医师每年应出勤总工时: Float {
    //        法定每年工作日 * 每天治疗师应出勤小时
    //    }
    
    var 每年预估护士人均休假小时: Float {
        每年护士人均应休假小时数 + 每年护士人均其他非工作小时数
    }
    var 每年预估医师人均休假小时: Float {
        每年医师人均应休假小时数 + 每年医师人均其他非工作小时数
    }
    var 每年预估技师人均休假小时: Float {
        每年技师人均应休假小时数 + 每年技师人均其他非工作小时数
    }
    var 每年预估治疗师人均休假小时: Float {
        每年治疗师人均应休假小时数 + 每年治疗师人均其他非工作小时数
    }
    var 每年预估文员人均休假小时: Float {
        每年文员人均应休假小时数 + 每年文员人均其他非工作小时数
    }
    
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

