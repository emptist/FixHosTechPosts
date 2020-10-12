//
//  ReportOnDoctTech.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/10/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ReportOnDoctTech: View {
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
                Text(userData.elements[self.elementIndex].reportOnDoctor)
            }//.font(.body)
            Spacer()
        }
        //.font(.body)
    }
}


extension Element {
    var reportOnDoctor: String {
        """
        \(reportOnDoctorTitle)
        \(reportOnDoctorHead)
        \(reportOnDoctorBody)
        \(reportOnDoctorFoot)
        """
    }
    
    var reportOnDoctorTitle: String {
        """
        \(科室名称)临床医师定编
        
        """
    }
    var reportOnDoctorHead: String {
        """
        由于多数科室业务受疫情影响严重，本次定编工作将主要根据2019年的业务数据，並结合科主任访谈，来建议未来1年的编制。
        本科室现有医师\(Int(目前医生人数))人，技师\(Int(目前技师人数 ?? 0))人，护士\(Int(目前护士人数 ))人，文员\(Int(目前文员人数 ?? 0))人。
        按照法定工作日\(Int(法定每年工作日))天计算，每位医师、技师、护士和文员每年最多分别出勤\(Int(每位医师每年应出勤总工时))、\(Int(每位医师每年应出勤总工时))、\(Int(每位护士每年应出勤总工时))和\(Int(每位文员每年应出勤总工时))小时，根据医药卫生系统行政法规规范等要求，结合科室性质、教学、科研等因素，以及正常的个人休假等因素，平均每人分别扣除非正常工作时间医师\(每年医师人均其他非工作小时数 + 每年医师人均应休假小时数)、技师\(每年技师人均其他非工作小时数 + 每年技师人均应休假小时数)、护士\(每年护士人均其他非工作小时数 + 每年护士人均应休假小时数)和文员\(每年文员人均其他非工作小时数 + 每年文员人均应休假小时数)小时，则每位人员每年估算有效工作时间分别为医师\(每位医师每年实际出勤总工时)、技师\(每位技师每年实际出勤总工时)、护士\(每位护士每年实际出勤总工时)、文员\(每位文员每年实际出勤总工时)小时。
        """
    }
    
    //@ViewBuilder
    var reportOnDoctorBody: String {
        reportOfRoomUnits +
        reportOfDeviceUnits +
        reportOfOperationUnits +
        reportOfDutyUnits
    }
    
    
    var reportOfRoomUnits: String {
        var table = ""
        table += "班次名称\t医师人数\t技师人数\t每班小时\t每周天数\t医师人小时\t技师人小时\t备注\n"
        for each in roomUnits {
            table += """
            \(each.doctorLine)
            """
        }
        return """
        根据本科室特点，采用按诊室组定编方法。计算要点为：
        
        \t某类人员人数 = 全年各诊室本类人员总计服务人小时 / 全年本类人员单人实际可出勤总小时数
        
        分组如下：
        \(table)
        
        各组合计所需医师人数为\(各诊室组共需医师人数)人，所需技师人数为\(各诊室组共需技师人数)。因已包含科室主任，故不增加管理机动人数，定编医师取整数为\(Int(定编医师人数.rounded()))人，定编技师取整数为\(Int(定编技师人数.rounded()))人。
        """
    }
    
    var reportOfDeviceUnits: String {
        ""
    }
    
    var reportOfOperationUnits: String {
        var table = ""
        table += "项目名称\t医师人数\t助产士数\t每次分钟\t全年次数\t医师总小时\t技师总小时\t备注\n"
        for ou in operatorUnits {
            for each in ou.checkItems {
                table += each.techLine
            }
        }
        return """
        
        须配备人员
        
        为了满足全年需要，而需要配备的医师人头数，计算逻辑为：
        
        \t人数 = 每年合计占用人小时数 / 全年单人实际可出勤总小时数
        
        根据科室特点，按照不同类型分组计算。列表如下：
        
        \(table)
        据此完成全年以上项目合计分别需要：
        医师\(各操作组共需医师人数)人，
        技师\(各操作组共需技师人数)人，
        护士\(各操作组共需护士人数)人，
        文员\(各操作组共需文员人数)人。
        """

    }
    
    var reportOfDutyUnits: String {
        ""
    }
    
    var reportOnDoctorFoot: String {
        guard let 政策规范 = 政策法规 else {
            return """
            注：\(备注)
            注：\(已经确认 ? "已经" : "尚未")访谈
            """
        }
        return """
        注：\(政策规范)
        注：\(备注)
        注：\(已经确认 ? "已经" : "尚未")访谈
        """
    }
    
    
}


//
//extension ComplexDutyGroup {
//    var doctorLine: String {
//        """
//        \(name)\t\(Int(配备医师数 ?? 0))\t\(在班小时数)\t\(每周排班天数)\t\(配备医师每年总工时)\t\(备注)\n
//        """
//    }
//}
//
extension RoomUnit {
    var doctorLine: String {
        """
        \(诊室组名称)\t\(配备医师数)\t\(配备技师数 ?? 0)\t\(每天开放小时 ?? 0)\t\(每月开放天数 ?? 0)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(备注)\n
        """
    }
}
//
//
extension TaskItem {
    var techLine: String {
        """
        \(项目名称)\t\(配备医师数)\t\(配备技师数)\t\(每次所需分钟)\t\(年总次数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(备注)\n
        """

    }
//    var doctorLine: String {
//        """
//        \(项目名称)\t\(配备医师数)\t\(配备技师数)\t\(每次所需分钟)\t\(年总次数)\t\(配备医师每年总工时)\t\(配备技师每年总工时)\t\(备注)\n
//        """
//    }

}

