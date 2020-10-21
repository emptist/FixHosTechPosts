//
//  ReportOnTechView.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/10/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

var md: Bool = true

struct ReportOnTechView: View {
    @EnvironmentObject var userData: UserData
    @State var name: String = ""
    
    //var element:Element
    var elementIndex: Int
    //    {
    //        userData.elements.firstIndex(where: { $0.id == element.id })!
    //    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Text(userData.elements[self.elementIndex].reportOnTech)
            }//.font(.body)
            Spacer()
        }
        //.font(.body)
    }
}


extension Element {
    var md: Bool { true }
    
    var reportOnTech: String {
        """
        \(reportOnTechTitle)
        \(reportOnTechHead)
        \(reportOnTechBody)
        \(reportOnTechFoot)
        """
    }
    
    var reportOnTechTitle: String {
        """
        \(md ? "\n" : "")
        \(md ? "##" : "") \(科室名称)定编
        """
    }
    var reportOnTechHead: String {
        """
        由于多数科室业务受疫情影响严重，本次定编工作将主要根据2019年的业务数据，並结合科主任访谈，来建议未来1年的编制。
        本科室现有医师\(Int(目前医生人数))人，技师\(Int(目前技师人数 ?? 0))人，护士\(Int(目前护士人数 ))人，文员\(Int(目前文员人数 ?? 0))人。
        按照法定工作日\(Int(法定每年工作日))天计算，每位医师、技师、护士和文员每年最多分别出勤\(Int(每位医师每年应出勤总工时))、\(Int(每位医师每年应出勤总工时))、\(Int(每位护士每年应出勤总工时))和\(Int(每位文员每年应出勤总工时))小时，根据医药卫生系统行政法规规范等要求，结合科室性质、教学、科研等因素，以及正常的个人休假等因素，平均每人分别扣除非正常工作时间医师\(每年医师人均其他非工作小时数 + 每年医师人均应休假小时数)、技师\(每年技师人均其他非工作小时数 + 每年技师人均应休假小时数)、护士\(每年护士人均其他非工作小时数 + 每年护士人均应休假小时数)和文员\(每年文员人均其他非工作小时数 + 每年文员人均应休假小时数)小时，则每位人员每年估算有效工作时间分别为医师\(每位医师每年实际出勤总工时)、技师\(每位技师每年实际出勤总工时)、护士\(每位护士每年实际出勤总工时)、文员\(每位文员每年实际出勤总工时)小时。
        """
    }
    
    //@ViewBuilder
    var reportOnTechBody: String {
        reportOfRoomUnits +
        reportOfDeviceUnits +
        reportOfOperationUnits +
        reportOfDutyUnits +
        reportOfSpecial
    }
    
    var reportOfSpecial: String {
        if "药学部" == 科室名称 {
            return """
            \n\n其他功能组定编
            临床药学组药师定编：
            根据行业规范和政策要求，三甲医院每百张床配置1名临床药学药师，至少配置5人，期望未来几年随着医院发展，按照1000张病床配置10名药师。
            检测组药师定编：
            目前2位药师，基本适应工作需要，本次定编维持2人。
            """
        } else {
            return ""
        }
    }
    
    var reportOfRoomUnits: String {
        
        var table = ""
        for each in roomUnits where each.needed {
            table += """
            \(each.techLine)
            """
        }
        if table.isEmpty {
            return ""
        }
        
        let headline = md ? """
        
        : 分诊室人员配置表

        |诊室名称|医师人数|技师人数|护士人数|文员人数|每天小时|每月天数|医师人小时|技师人小时|护士人小时|文员人小时| 备注 |
        |:-----|:------|-----:|------:|------:|-----:|-----:|-------:|--------:|-------:|-------:|:---:|
        """ : "诊室名称\t医师人数\t技师人数\t护士人数\t文员人数\t每天小时\t每月天数\t医师人小时\t技师人小时\t护士人小时\t文员人小时\t备注\n"
            
        return """
        \n按诊室分组定编方法，计算要点为：
        
        
        \t某类人员人数 = 全年各诊室本类人员总计服务人小时 / 全年本类人员单人实际可出勤总小时数
        
        
        各诊室分组如下：
        \(headline + "\n" + table + "\n")
        
        上述各组合计所需人数为：医师\(各诊室组共需医师人数)人，技师\(各诊室组共需技师人数)人，护士\(各诊室组共需护士人数)人，文员\(各诊室组共需文员人数)人。
        """
    }
    
    var reportOfDeviceUnits: String {
        if deviceUnits.isEmpty {
            return ""
        }
        
        var table = ""
        for each in deviceUnits where each.needed {
            table += """
            \(each.techLine)
            """
        }
        if table.isEmpty {
            return ""
        }
        
        let headline = "设备名称\t医师人数\t技师人数\t护士人数\t文员人数\t每天小时\t每年小时\t医师人小时\t技师人小时\t护士人小时\t文员人小时\t备注\n"
        
        return """
        \n按器械设备分组定编方法，计算要点为：
        
        \t某类人员人数 = 全年各器械设备本类人员总计服务人小时 / 全年本类人员单人实际可出勤总小时数
        
        各器械设备组罗列如下：
        \(headline + table)
        
        上述设备合计配备人数为：医师\(各设备组共需医师人数)人，技师\(各设备组共需技师人数)人，护士\(各设备组共需护士人数)人，文员\(各设备组共需文员人数)人。
        """
        
    }
    
    var reportOfOperationUnits: String {
        if operatorUnits.isEmpty {
            return ""
        }
        
        var table = ""
        for ou in operatorUnits {
            for each in ou.checkItems where each.needed {
                table += each.techLine
            }
        }
        if table.isEmpty {
            return ""
        }
        
        let headline = "业务\t医师人数\t技师人数\t护士人数\t文员人数\t每次分钟\t全年次数\t医师总小时\t技师总小时\t护士总小时\t文员总小时\t备注\n"
        return """
        
        \n按业务分组配备人员，计算逻辑为：
        
        \t人数 = 每年合计占用人小时数 / 全年单人实际可出勤总小时数
        
        业务分组列表如下：
        
        \(headline + table)
        上述业务组合计分别需要： 医师\(各操作组共需医师人数)人，技师\(各操作组共需技师人数)人，护士\(各操作组共需护士人数)人，文员\(各操作组共需文员人数)人。
        """

    }
    
    var reportOfDutyUnits: String {
        if dutyGroups.isEmpty {
            return ""
        }
        
        var table = ""
        for each in dutyGroups where each.needed {
            table += """
            \(each.techLine)
            """
        }
        if table.isEmpty {
            return ""
        }
        
        let headline = "班次名称\t医师人数\t技师人数\t护士人数\t文员人数\t每班小时\t每周天数\t医师人小时\t技师人小时\t护士人小时\t文员人小时\t备注\n"
        
        return """
        \n根据排班进行定编。计算要点为：
        
        \t某类人员人数 = 全年各诊室本类人员总计服务人小时 / 全年本类人员单人实际可出勤总小时数
        
        排班分组如下：
        \(headline + table)
        
        上述排班合计所需人数为：医师\(各排班组共需医师人数)人，技师\(各排班组共需技师人数)人，护士\(各排班组共需护士人数)人，文员\(各排班组共需文员人数)人。
        """
        
    }
    
    var reportOnTechFoot: String {
        let conclusion = """
        综合考虑排班、机动等因素之后， 取整数则各系列定编为：
        医师： \(Int(定编医师人数.rounded()))人，技师： \(Int(定编技师人数.rounded()))人，护士： \(Int(定编护士人数.rounded()))人，文员： \(Int(定编文员人数.rounded()))人。
        """
        guard let 政策规范 = 政策法规 else {
            return """
            \(conclusion)
            注：\(备注)
            注：\(已经确认 ? "已经" : "尚未")访谈
            """
        }
        return """
        \(conclusion)
        
        注：\(政策规范)
        注：\(备注)
        注：\(已经确认 ? "已经" : "尚未")访谈
        """
    }
}


extension ComplexDutyGroup {
    var needed: Bool {
        let ndo = 配备医师数 ?? 0
        let nte = 配备技师数 ?? 0
        //let nnu = 配备护士数 ?? 0
        let ncl = 配备文员数 ?? 0

        let sum = ndo + nte + ncl //+ nnu

        return sum > 0 && (在班小时数 > 0)
    }
    
    var techLine: String {
        """
        \(name)\t\(Int(配备医师数 ?? 0))\t\(Int(配备技师数 ?? 0))\t\(Int(配备护士数 ?? 0))\t\(Int(配备文员数 ?? 0))\t\(在班小时数)\t\(每周排班天数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(配备护士每年总工时)\t\(配备文员每年总工时)\t\(备注)\n
        """
    }
}



extension RoomUnit {
    var needed: Bool {
        (配备技师数 + 配备医师数 + 配备护士数 + 配备文员数 > 0) && (每天开放小时 > 0)
    }
    
    var techLine: String {
        if needed {
            return md ? """
                |\(诊室组名称)|\(配备医师数)|\(配备技师数)|\(配备护士数)|\(配备文员数)|\(每天开放小时)|\(每月开放天数)|\(配备医师每年总工时)|\(配备技师每年总工时)|\(配备护士每年总工时)|\(配备文员每年总工时)|\(备注)|
                
            """ : """
            \(诊室组名称)\t\(配备医师数)\t\(配备技师数)\t\(配备护士数)\t\(配备文员数)\t\(每天开放小时)\t\(每月开放天数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(配备护士每年总工时)\t\(配备文员每年总工时)\t\(备注)\n
            """
            
        } else {
            return  ""
        }
        
    }
}

extension DeviceUnit {
    var needed: Bool {
        ((配备技师数 + 配备医师数 + 配备护士数 + 配备文员数) > 0)
    }
    var techLine: String {
        """
        \(设备组名称)\t\(配备医师数)\t\(配备技师数)\t\(配备护士数)\t\(配备文员数)\t\(每天开放小时)\t\(每年开放小时数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(配备护士每年总工时)\t\(配备文员每年总工时)\t\(备注)\n
        """
    }
}
//
//
extension TaskItem {
    var needed: Bool {
        ((配备技师数 + 配备医师数 + 配备护士数 + 配备文员数) > 0) && ((每次所需分钟 + 年总次数) > 0)
    }
    var techLine: String {
        """
        \(项目名称)\t\(配备医师数)\t\(配备技师数)\t\(配备护士数)\t\(配备文员数)\t\(每次所需分钟)\t\(年总次数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(配备护士每年总工时)\t\(配备文员每年总工时)\t\(备注)\n
        """

    }
}


//protocol UtilizedUnit {
//    var needed: Bool { get }
//}
//
//extension UtilizedUnit {
//    var needed: Bool {
//        let ndo = 配备医师数 ?? 0
//        let nte = 配备技师数 ?? 0
//        let nnu = 配备护士数 ?? 0
//        let ncl = 配备文员数 ?? 0
//
//        // 怪事：加上护士就不行
//        let sum = ndo + nte + nnu + ncl
//
//        return sum > 0 && (在班小时数 > 0)
//    }
//}
