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
    var 本年度执业医师人数: Float?
    var 病房定编护士长人数: Float = 1
    var 病房护理班次数: Int = 3
    var 病房每床日医师日常工作分钟 : Float = 40 // 内科40分钟 , 外科50分钟
    var 病房每天值班医师人数: Float = 1
    /*
     未使用: 出院患者手术台次数, 是指出院患者手术人数，即同一次住院就诊期间患有同一疾病或不同疾病施行多次手术患者，按1人统计。
     统计单位以人数计算，总数为手术和介入治疗人数累加求和。
    */
    var 出院患者手术台次数: Float? // 未使用
    var 出院患者四级手术台次数: Float? //未使用
    var 出院患者微创手术台次数: Float? //未使用
    var 出院者占用总床日数: Float? //出院者占用总床日数 即 同期收治患者人天数,所有出院人数的住院床日之和。包括正常分娩、未产出院、住 院经检查无病出院、未治出院及健康人进行人工流产或绝育手术 后正常出院者的住院床日数。
    var 年出院人次数: Float = 0
    //def
    var 单个患者出入院所需分钟 : Float = 120 // 观察值
    var 法定每年工作日: Float = 250
    //ghi
    var 管理及机动医师人数: Float?
    var 管理及机动护士人数: Float?
    var 护理白班小时数: Float = 8
    var 护理中班小时数: Float = 6
    var 护理夜班小时数: Float = 10
    
    var 护理白班开始时间: Float = 8 // 不再使用
    var 护理白班结束时间: Float = 16 // 不再使用
    var 护理白班每位护士管理床数: Float? = 8
    var 护理白班安排其他护士人数: Float = 0
    var 护理白班固定值班人数: Float?
    
    var 护理中班开始时间: Float = 16 // 不再使用
    var 护理中班结束时间: Float = 22 // 不再使用
    var 护理中班每位护士管理床数: Float? = 12
    var 护理中班安排其他护士人数: Float = 0
    var 护理中班固定值班人数: Float?
    
    var 护理夜班开始时间: Float = 22 // 不再使用
    var 护理夜班结束时间: Float = 8 // 不再使用
    var 护理夜班每位护士管理床数: Float?
    var 护理夜班安排其他护士人数: Float = 2
    var 护理夜班固定值班人数: Float? = 2
    //jkl
    var 开放床位数 : Float = 0
    var 科室名称: String
    var 类别: String = ""
    //mno
    var 每年病房手术台数: Float = 0
    var 每年护士人均应休假小时数: Float = 35
    var 每年护士人均其他非工作小时数: Float = 15
    var 每年开放病房日数: Float = 365
    var 每年开放门诊日数: Float = 365
    var 每年实际门诊量: Float = 0
    var 每年实际收治病人数: Float? // 不用此数据
    var 每年实际手术台数: Float = 0 // 目前用病房手术台数,若有门诊手术,则计算方法与病房手术计算方法一致,亦可以此为数据源,取代病房手术台数,合并计算
    var 每年医师人均应休假小时数: Float = 60
    var 每年医师人均其他非工作小时数: Float = 20
    var 每天每位医师查房下医嘱小时数: Float = 4 // 约定值
    var 每天医师应出勤小时: Float = 8
    var 每天护士应出勤小时: Float = 7
    var 每位医生平均管床数: Float = 10 // 约定值
    var 每位医师每小时门诊大致人次: Float = 7 // 观察值
    var 每月用床日数: Float = 30
    var 门诊医师每月有效工作天数: Float = 21
    var 门诊护士固定人数: Float?
    var 目前护士人数: Float = 0
    var 目前技师人数: Float?
    var 目前医生人数: Float = 0
    var 目前治疗师人数: Float?
    //pqr
    var 每台手术平均医师人数 : Float = 3 // 约定值
    //stu
    var 上年度执业医师人数: Float?
    var 上午出诊人数: Float = 3
    var 上午门诊小时数: Float = 4
    var 已经确认 = false
    //vwx
    var 下午出诊人数: Float = 1
    var 下午门诊小时数: Float = 4
    //yz
    var 重症病房固定护士人数: Float?
    
    
    /// 算法
    //abc
    var 病房出入院所需医生人数 : Float {
        每月实际收治病人数 * 单个患者出入院所需分钟 / 每月每位医师法定工作分钟
    }
    var 病房护士定编人数: Float {
        每年病房护理总小时数 / 每位护士每年实际出勤总工时 + (管理及机动护士人数 ?? 病房定编护士长人数)
    }

    var 病房每日值班小时数: Float {
        24 - 每天每位医师查房下医嘱小时数
    }
    var 病房平均每天手术台数: Float {
        每年病房手术台数 / 法定每年工作日
    }
    var 病房手术所需医生人数 : Float {
        每月病房手术台数 * 平均每台手术分钟 * 每台手术平均医师人数 / 每月每位医师法定工作分钟
    }
    var 病房日常工作所需医生人数 : Float {
        开放床位数 * 每月用床日数 * 病房每床日医师日常工作分钟 / 每月每位医师法定工作分钟
    }
    var 病房医师定编人数 : Float {
        //根据总工时推算病房医师编制
        根据任务分解推算病房医师编制
    }
    var 查房下医嘱所需医师人数: Float {
        开放床位数 / 每位医生平均管床数
    }
    
    var category: String {
        return 类别
    }
    
    //def
    
    //ghi
    var 根据排班推算门诊编制: Float {
        每年门诊总工时 / 每位医师每年实际出勤总工时
    }
    var 根据任务分解推算病房医师编制: Float {
        病房日常工作所需医生人数 + 病房出入院所需医生人数 + 病房手术所需医生人数
    }
    var 根据效率推算门诊编制: Float {
        每月平均门诊量 / 每位医师每月可承担门诊量
    }
    var 根据总工时推算病房医师编制: Float {
        每年病房工作实际总小时数 / 每位医师每年实际出勤总工时
    }
    
    var 护床比定编后: Float {
        病房护士定编人数 / 开放床位数
    }
    
    var 护床比定编前: Float {
        目前护士人数 / 开放床位数
    }
    
    var 护理白班护士人数: Float {
        guard let n = 护理白班固定值班人数  else {
            return (开放床位数 / 护理白班每位护士管理床数!) + 护理白班安排其他护士人数
        }
        return n + 护理白班安排其他护士人数
    }
    
//    var 护理白班小时数: Float {
//        if 护理白班结束时间 < 护理白班开始时间 {
//            return 24 + 护理白班结束时间 - 护理白班开始时间
//        } else {
//            return 护理白班结束时间 - 护理白班开始时间
//        }//    护理白班结束时间 - 护理白班开始时间
//    }
    
    var 护理白班全年总工作小时数: Float {
        护理白班护士人数 * 护理白班小时数 * 每年开放病房日数
    }
    
    var 护理中班护士人数: Float {
        guard let n = 护理中班固定值班人数  else {
            return (开放床位数 / 护理中班每位护士管理床数!) + 护理中班安排其他护士人数
        }
        return n + 护理中班安排其他护士人数
    }
    
//    var 护理中班小时数: Float {
//        if 护理中班结束时间 < 护理中班开始时间 {
//            return 24 + 护理中班结束时间 - 护理中班开始时间
//        } else {
//            return 护理中班结束时间 - 护理中班开始时间
//        }
//    }
    var 护理中班全年总工作小时数: Float {
        护理中班护士人数 * 护理中班小时数 * 每年开放病房日数
    }
    
    
    var 护理夜班护士人数: Float {
        guard let n = 护理夜班固定值班人数  else {
            return (开放床位数 / 护理夜班每位护士管理床数!) + 护理夜班安排其他护士人数
        }
        return n + 护理夜班安排其他护士人数
    }
        
//    var 护理夜班小时数: Float {
//        if 护理夜班结束时间 < 护理夜班开始时间 {
//            return 24 + 护理夜班结束时间 - 护理夜班开始时间
//        } else {
//            return 护理夜班结束时间 - 护理夜班开始时间
//        }
//    }
    
    var 护理夜班全年总工作小时数: Float {
        护理夜班护士人数 * 护理夜班小时数 * 每年开放病房日数
    }
    var id: String {
        return 科室名称
    }
    var isConfirmed: Bool {
        已经确认
    }
    
    //jkl
    var 临床医师定编人数 : Float {
        门诊医师定编人数 + 病房医师定编人数 + (管理及机动医师人数 ?? 0)
    }
    
    //mno
    var 每年病房查房下医嘱实际小时数: Float {
        查房下医嘱所需医师人数 * 每天每位医师查房下医嘱小时数 * 每年开放病房日数
    }
    var 每年病房工作实际总小时数: Float {
        每年病房手术实际小时数 + 每年病房医师值班实际小时数 + 每年病房查房下医嘱实际小时数
    }
    
    var 每年病房护理总小时数: Float {
        护理白班全年总工作小时数 + 护理中班全年总工作小时数 + 护理夜班全年总工作小时数 + (每年重症病房护理总小时数 ?? 0)
    }
        
    var 每年预估护士人均休假小时: Float {
        每年护士人均应休假小时数 + 每年护士人均其他非工作小时数
    }
    var 每年预估医师人均休假小时: Float {
        每年医师人均应休假小时数 + 每年医师人均其他非工作小时数
    }
 
    var 每年重症病房护理总小时数: Float? {
        guard let ncount = 重症病房固定护士人数 else {
            return nil
        }
        return ncount * 每年开放病房日数
    }
    
    var 每年病房手术实际小时数: Float {
        平均每台手术小时 * 每年病房手术台数 * 每台手术平均医师人数
    }
    var 每年病房医师值班实际小时数: Float {
        每年开放病房日数 * 病房每天值班医师人数 * 病房每日值班小时数
    }
    var 每年门诊总工时: Float {
        每年上午总工时 + 每年下午总工时
    }
    var 每年上午总工时: Float {
        上午出诊人数 * 上午门诊小时数 * 每年开放门诊日数
    }

    var 每年下午总工时: Float {
        下午出诊人数 * 下午门诊小时数 * 每年开放门诊日数
    }
    
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
    
    var 每位医师每月可承担门诊量: Float {
        每天医师应出勤小时 * 门诊医师每月有效工作天数 * 每位医师每小时门诊大致人次
    }
    
    var 每月每位医师法定工作分钟 : Float {
        门诊医师每月有效工作天数 * Float(每天医师应出勤小时) * 60
    }
    var 每月平均门诊量: Float {
        每年实际门诊量 / 12
    } //1000
    var 每月实际收治病人数 : Float {
        年出院人次数 / 12
    }//= 150
    var 每月病房手术台数 : Float {
        每年病房手术台数 / 12
    }//= 80

    var 门诊医师定编人数: Float {
        根据效率推算门诊编制
    }
    
    var name: String {
        return 科室名称
    }
    
    //pqr
    var pinyin: String {
        return 科室名称.applyingTransform(.toLatin, reverse: false) ?? 科室名称
    }
    var 平均每台手术分钟 : Float {
        平均每台手术小时 * 60
    }
    var 平均每台手术小时 : Float {
        每天医师应出勤小时 / 病房平均每天手术台数
    }
    var 人数: Float {
        目前医生人数 + 目前护士人数 + (目前治疗师人数 ?? 0) + (目前技师人数 ?? 0)
    }
    
    //stu
    
    //vwx
    
    //yz
    var 医床比定编后: Float {
        病房医师定编人数 / 开放床位数
    }
    var 医床比定编前: Float {
        目前医生人数 / 开放床位数
    }
    var 医护比定编后: Float {
        病房医师定编人数 / 病房护士定编人数
    }
    
    var 医护比定编前: Float {
        目前医生人数 / 目前护士人数
    }
    
    
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case 门诊 = "门诊"
        case 急诊 = "急诊"
        case 病房 = "病房"
        case 医技 = "医技"
    }
    
}

struct Component {
    var 主任医师人数: Float = 0.1
    var 副主任医师人数: Float = 0.1
    var 主治医师人数: Float = 0.1
    var 博士医师人数: Float = 0.1
    var 硕士医师人数: Float = 0.1
    var 本科医师人数: Float = 0.1
    
    var 主任护师人数: Float = 0.1
    var 副主任护师人数: Float = 0.1
    var 主管护师人数: Float = 0.1
    var 博士护师人数: Float = 0.1
    var 硕士护师人数: Float = 0.1
    var 本科护师人数: Float = 0.1
}
