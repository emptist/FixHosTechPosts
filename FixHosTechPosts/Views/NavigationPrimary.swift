//
//  NavigationPrimary.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationPrimary: View {
    @EnvironmentObject var userData: UserData
    @Binding var selectedElement: Element?
    
    @State var newName: String = ""
    
    fileprivate func addItem() {
        for each in self.userData.elements {
            if each.科室名称 == self.newName {
                return
            }
        }
        self.userData.elements.append(Element(科室名称:self.newName))
    }
    
    var body: some View {
        VStack {
            ElementList(selectedElement: $selectedElement)
                .listStyle(SidebarListStyle())
            
            HStack {
                TextField("新增科室名", text: $newName)
                Button(action: {
                    //self.addItem()
                    self.userData.addElement(self.newName)
                    self.selectedElement = self.userData.elements.first(where: { element in
                        element.name == self.newName
                    })
                }) {
                    Text("添加")
                }
            }.padding()
            
        }
            .frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationPrimary_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPrimary(selectedElement: .constant(elementData[0])).environmentObject(UserData())
    }
}
