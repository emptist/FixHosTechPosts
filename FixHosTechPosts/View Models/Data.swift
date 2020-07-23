//
//  Data.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import Cocoa
import SwiftUI
import CoreLocation

let filename = "deptData.json"
let vapper = true
var elementData: [Element] = load(filename)
let dev = true

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    let file: URL
    if FileManager().fileExists(atPath: filename) {
        file = URL(fileURLWithPath: filename)
    } else if vapper {
        return [Element(科室名称: "肾内科", 类别: "内科")] as! T
    } else {
        file = Bundle.main.url(forResource: filename, withExtension: nil)!
    }
    
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        if dev {
            return [Element(科室名称: "肾内科", 类别: "内科")] as! T
        }
        else {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
        
        
    }
}

func save<T: Encodable>(_ data: T) {
    //let dir = FileManager.default.currentDirectoryPath
    let file = URL(fileURLWithPath: filename)
    
    let encoder = JSONEncoder()
    guard let json = try? encoder.encode(data) else {
        fatalError("Couldn't encode data")
    }
    
    do {
        try json.write(to: file)
    }
    catch {
        fatalError("Couldn't save to \(filename) in main bundle")
    }
}
