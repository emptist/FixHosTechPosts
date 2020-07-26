//
//  LabeledTextField.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct LabeledTextField: View {
    @State var name: String = "hello"
    var body: some View {
        Form {
            TextField("doing",text:$name)
                .vLabel(label: "姓名")
            TextField("请填写", value: $name, formatter: NumberFormatter())
                .hLabel(label: "门诊量")
            
        }.font(.headline)
    }
}

struct VLabeledTextField: ViewModifier  {
    var label: String
    
    func body(content: Content) -> some View {
        VStack(alignment: .center) {
            Text(label)
            content
        }
    }
}


struct HLabeledTextField: ViewModifier {
    var label: String
    
    func body(content: Content) -> some View {
        HStack(alignment: .center) {
            Text(label)
            content
        }
    }
}

extension View {
    func vLabel(label: String) -> some View {
        self.modifier(VLabeledTextField(label:label))
    }
    func hLabel(label: String) -> some View {
        self.modifier(HLabeledTextField(label: label))
    }
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextField()
    }
}
