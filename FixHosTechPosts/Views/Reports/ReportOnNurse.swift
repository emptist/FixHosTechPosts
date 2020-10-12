//
//  ReportOnNurse.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/9/16.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ReportOnNurse: View {
    @EnvironmentObject var userData: UserData
    @State var name: String = ""
    
//    var element:Element
    var elementIndex: Int
//    {
//        userData.elements.firstIndex(where: { $0.id == element.id })!
//    }
//
    var body: some View {
            VStack(alignment: .leading) {
                ScrollView {
                    Text(userData.elements[self.elementIndex].reportOnNurse)
            }
                Spacer()
        }
        //.font(.body)
    }
}

extension Element {
    var reportOnNurse: String {
        let conclusion = """
        扣除各种假期后护士全年应出勤小时数为\(每位护士每年应出勤总工时)
        故此，护士定编人数取整数为\(Int(定编护士人数.rounded()))人。
        """
        
        switch name {
            case "中医科","急诊科":
                return """
            在临床应用中完成.
            """

            default:
                let reportHead = """
                \(name)现有护士人数\(Int(目前护士人数))人。
                """
                let info = """
                根据本科室业务结构加以综合分析进行定编计算。
                """
//                """
//                通过工作日志法，以两周护理工作时长作为统计样本，根据正态分布，推算全年的护理工作时长。
//                若推算的全年工作小时数与排班法形成的每年护理总工作小时数之间的误差在一定范围内，则说明排班是合理的。
//                根据标准差计算，通常在0.5%范围内的误差是正常的。
//                """
                
                let body = (各操作组共需护士人数 + 各设备组共需护士人数 + 各诊室组共需护士人数 + 各排班组共需护士人数 <= 0) ? "无排班数据。" : info + "\n" + complexTable + "\n\n" + conclusion + "\n" + specialNote
                
                return reportHead + "\n\n" + body
            
        }
    }
    
    
    var complexTable: String {
        var table: String = ""
        
        if 各设备组共需护士人数 > 0 {
            table += "设备配置表\n\n"
            table += "名称\t配备人数\t每天小时\t每月天数\t全年小时数\t备注\n"
            for each in deviceUnits { table += each.infoLine}
        }
        
        if 各操作组共需护士人数 > 0 {
            table += "业务分解计算表\n\n"
            table += "项目名称\t护士人数\t单次分钟\t年总次数\t全年小时数\t备注\n"
            for ou in operatorUnits {
                for each in ou.checkItems {
                    table += each.infoLine
                }
            }
        }
        
        if 各排班组共需护士人数 > 0 {
            table += "综合排班表\n\n"
            table += "名称\t每班人数\t每班小时\t每周天数\t全年小时数\t备注\n"
            for each in dutyGroups { table += each.infoLine}
        }
        
        if 各诊室组共需护士人数 > 0 {
            table += "诊间人员表\n\n"
            table += "诊间名称\t配备人数\t每天小时\t每月天数\t诊间数\t全年小时数\t备注\n"
            for each in roomUnits { table += each.infoLine}
        }
        
        return """
        采用综合分析方法，情况如下:
        \(table)
        """
    }
    
    var specialNote: String {
        
        return 政策法规 ?? ""
        
    }
}


extension ComplexDutyGroup {
    var infoLine: String {
        guard let 配备护士数 = 配备护士数 else { return ""}
        guard 配备护士数 > 0 else { return "" }
        return """
        \(name)\t\(配备护士数)\t\(在班小时数)\t\(每周排班天数)\t\(配备护士每年总工时)\t\(备注)\n
        """
    }
    
}

extension TaskItem {
    var infoLine: String {
        guard 配备护士数 > 0 else { return "" }
        return """
        \(项目名称)\t\(配备护士数)\t\(每次所需分钟)\t\(年总次数)\t\(每年操作小时数)\t\(备注)\n
        """
    }
    
}

extension DeviceUnit {
    var infoLine: String {
        guard 配备护士数 > 0 else { return "" }
        return """
        \(设备组名称)\t\(配备护士数)\t\(每天开放小时)\t\(每月开放天数)\t\(配备护士每年总工时)\t\(备注)\n
        """
    }
    
}

extension RoomUnit {
    var infoLine: String {
        guard 配备护士数 > 0 else { return "" }
        return """
        \(诊室组名称)\t\(配备护士数)\t\(每天开放小时)\t\(每月开放天数)\t\(房间数)\t\(配备护士每年总工时)\t\(备注)\n
        """
    }
    
}

//struct ReportOnNurse_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportOnNurse()
//    }
//}
