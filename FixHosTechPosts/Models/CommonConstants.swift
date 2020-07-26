//
//  CommonConstants.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/20.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation

struct 常量: Hashable, Codable {
    
    //ghi
    let 全年服务天数: Int = 365
    var 法定每年休息日和节假日: Int = 115
    var 法定每年工作日: Int {
        全年服务天数 - 法定每年休息日和节假日
    }
    
}
