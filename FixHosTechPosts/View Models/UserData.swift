//
//  UserData.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import Combine
import SwiftUI
import SwiftShell

/// Creating A PDF File
/// pandoc -s -f markdown -t html *.techs.md -o techs.pdf --metadata title="report"
/// open techs.pdf
///
/// Creating A ODT File
/// pandoc -s -f markdown -t odt *.techs.md -o techs.odt --reference-doc=style_reference.odt
///

final class UserData: ObservableObject {
    @Published var showKeysOnly = false
    @Published var elements = elementData {
        didSet {
            DispatchQueue.global(qos: .userInitiated).async {
                save(self.elements)
            }
        }
    }

    func saveReport(_ element: Element) -> Void {
        //element.saveReportOnNurse()
        element.saveReportOnTech()
//        let pandocSwift = """
//        /usr/local/bin/pandoc -s -f markdown -t odt *.techs.md -o techswift.odt --reference-doc=style_reference.odt
//        """
        let pandocSwift = "/usr/local/bin/pandoc --version"
        //runAsyncAndPrint("ls")
        let _ = runAsyncAndPrint(bash: pandocSwift)
        // /bin/bash: /usr/local/bin/pandoc: Operation not permitted
    }
    
    func saveReport() -> Void {
        for each in elements { //where each.目前护士人数 > 0 && each.临床护士定编人数 > 0 {
            each.saveReportOnTech()
            //each.saveReportOnNurse()
        }
        // todo
        // merge and convert, using Pandoc
        // pandoc -s -f markdown -t odt *.techs.md -o techs.odt --reference-doc=style_reference.odt

    }

    func operatorUnitsAt(_ elementIndex: Int) -> [OperatorUnit] {
        self.elements[elementIndex].operatorUnits
    }
    
    func addElement(_ newName:String) -> Void {
        for each in elements {
            if each.科室名称 == newName {
                return
            }
        }
        elements.append(Element(科室名称:newName))
    }
    
    func addDutyGroup(_ name: String, at selectedIdx: Int) {
        
        let newName = name.trimmingCharacters(in: .whitespaces)
        var repeated = false
        
        //guard let selectedIdx = elements.firstIndex(of: element) else {
        guard selectedIdx >= 0 else {
            return
        }
            
            for each in elements[selectedIdx].dutyGroups {
                if each.name == newName {
                    repeated = true
                    return
                }
            }
        
        if !repeated {
            elements[selectedIdx].dutyGroups.append(ComplexDutyGroup(name: newName))
        }
        
    }
    
    func removeDeviceUnit(elementIndex:Int,groupIndex:Int) {
        elements[elementIndex].deviceUnits.remove(at: groupIndex)
    }
    func addDeviceUnit(elementIndex:Int, 设备组名称: String, 台数: Float, 每月开放天数: Float, 每天开放小时: Float, 配备技师数:Float, 配备护士数: Float, 配备医师数: Float, 配备治疗师数: Float, 配备文员数: Float, 备注: String) -> Void {
        var device = DeviceUnit(设备组名称: 设备组名称, 台数: 台数, 每月开放天数: 每月开放天数, 每天开放小时: 每天开放小时,配备技师数:配备技师数,配备护士数: 配备护士数, 配备医师数: 配备医师数, 配备治疗师数: 配备治疗师数, 配备文员数: 配备文员数)
        device.备注 = 备注
        for each in elements[elementIndex].deviceUnits {
            if each.设备组名称 == 设备组名称 {
                return
            }
        }
        elements[elementIndex].deviceUnits.append(device)
    }
    
    func addRoomUnit(elementIndex:Int, 诊室名称: String, 房间数: Float, 每月开放天数: Float, 每天开放小时: Float, 配备技师数:Float, 配备护士数: Float, 配备医师数: Float, 配备治疗师数: Float, 配备文员数: Float, 备注: String) -> Void {
        var room = RoomUnit(诊室组名称: 诊室名称, 房间数: 房间数, 每月开放天数: 每月开放天数, 每天开放小时: 每天开放小时,配备技师数:配备技师数,配备护士数: 配备护士数, 配备医师数: 配备医师数, 配备治疗师数: 配备治疗师数, 配备文员数: 配备文员数)
        room.备注 = 备注
        elements[elementIndex].roomUnits.append(room)
    }
    
    func addOperatorUnit(elementIndex: Int, 操作组名称: String, 备注: String) -> Void {
        var operatorUnit = OperatorUnit(操作组名称: 操作组名称, checkItems: [])
        operatorUnit.备注 = 备注
        elements[elementIndex].operatorUnits.append(operatorUnit)
    }
    
    func addItem(elementIndex: Int, 操作组名称: String, 项目名称: String, 每次所需分钟: Float, 年总次数: Float, 配备技师数:Float, 配备护士数: Float, 配备医师数: Float,配备治疗师数: Float, 配备文员数: Float, 备注: String) -> Void {
        var item = TaskItem(项目名称: 项目名称, 每次所需分钟: 每次所需分钟, 年总次数: 年总次数,配备技师数:配备技师数,配备护士数: 配备护士数, 配备医师数: 配备医师数, 配备治疗师数: 配备治疗师数, 配备文员数: 配备文员数)
        item.备注 = 备注
        //print(item)
        guard let operatorUnitIndex = elements[elementIndex].operatorUnits.firstIndex(where: {unit in unit.操作组名称 == 操作组名称}) else {return}
        elements[elementIndex].operatorUnits[operatorUnitIndex].checkItems.append(item)
    }
}


extension Element {
    func saveReportOnTech() -> Void {
        //let filename = "\(name).techs.txt"
        let filename = "\(name).techs.md"
        writeReport(reportOnTech, to: filename)
    }
    
    func saveReportOnNurse() -> Void {
        if !name.contains("之") {
            let filename = "\(name).nurse.txt"
            writeReport(reportOnNurse, to: filename)
        }
        
    }
    
    func writeReport(_ report: String, to filename: String) -> Void {
        do {
            try report.write(to: URL(fileURLWithPath: filename), atomically: true, encoding: .utf8)
        }
        catch {
            fatalError("Couldn't save to \(filename) in main bundle")
        }
        
    }
}
