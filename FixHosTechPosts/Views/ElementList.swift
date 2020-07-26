//
//  ElementList.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementList: View {
    @EnvironmentObject private var userData: UserData
    @Binding var selectedElement: Element?
    //@Binding var filter: FilterType
    
    var body: some View {
        List(selection: $selectedElement) {
            ForEach(userData.elements.sorted(by: { $0.pinyin < $1.pinyin })) { element in
                if (!self.userData.showKeysOnly || element.已经确认){
                    ElementRow(element:element).tag(element)
                }
                
            }
        }
    }
}

