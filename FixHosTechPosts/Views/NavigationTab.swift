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
                DeviceGroup(elementIndex: elementIndex)
                    .tabItem {Text("设备组")}
                    //.position(.zero)
                    .padding()
                    //.offset(x: 0, y: -200)

                
                DoctorGroup(elementIndex: elementIndex)
                    .tabItem {Text("医师组")}
                    .padding()
                    
                    //.offset(x: 0, y: -200)

            }
        }
        
    }
}




struct NavigationDetail_Preview: PreviewProvider {
    static var previews: some View {
        NavigationDetail(selectedElement: elementData[0]).environmentObject(UserData())
    }
}
