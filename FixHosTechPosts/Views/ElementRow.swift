//
//  ElementRow.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementRow: View {
    var element: Element
    var body: some View {
        
        HStack(alignment: .center, spacing:12) {
            Text(element.科室名称)
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
            
            Spacer()
            
            if element.已经确认 {
                Image("star-filled")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.green)
                    .frame(width: 10, height: 10)
            }            
        }
        .padding(.vertical,4)
    }
}

