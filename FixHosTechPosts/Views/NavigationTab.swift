//
//  NavigationDetail.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationTab: View {
    @EnvironmentObject var userData: UserData
    
    //@Binding
    var selectedElement: Element
    
    var elementIndex: Int {
        userData.elements.firstIndex(where: { $0.id == selectedElement.id })!
    }
    private var numberFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }
    
    
    var body: some View {
        //VStack(alignment: .leading, spacing: 12) {
        VStack {
            DetailHead(elementIndex:elementIndex)
            
            TabView {
                Department(elementIndex: elementIndex)
                    .tabItem {Text("概要")}
                    .padding()
                
                RoomGroup(elementIndex: elementIndex)
                    .tabItem {Text("诊室组")}
                    //.position(.zero)
                    .padding()
                //.offset(x: 0, y: -200)

                
                DeviceGroup(elementIndex: elementIndex)
                    .tabItem {Text("设备组")}
                    //.position(.zero)
                    .padding()
                    //.offset(x: 0, y: -200)

                
                OperationGroup(elementIndex: elementIndex)
                    .tabItem {Text("操作组")}
                    .padding()
                    
                    //.offset(x: 0, y: -200)
                
                ScheduleGroup(elementIndex: elementIndex)
                    .tabItem {Text("排班组")}
                    .padding()
                
            }
        }
        
    }
}




struct NavigationTab_Preview: PreviewProvider {
    static var previews: some View {
        NavigationTab(selectedElement: elementData[0]).environmentObject(UserData())
    }
}
