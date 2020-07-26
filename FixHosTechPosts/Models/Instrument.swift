//
//  Instrument.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/23.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation

struct Instrument: Hashable, Codable, Identifiable {
    var id = UUID()
    var 设备名称: String
    
}
