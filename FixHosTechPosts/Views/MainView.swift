//
//  ContentView.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

var numberFormatter: NumberFormatter {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    return f
}

struct MainView: View {
    @EnvironmentObject var userData: UserData
    @State private var selectedElement: Element?
    
    var body: some View {
        NavigationView {
            NavigationPrimary(selectedElement: $selectedElement)
            NavigationTab(element:selectedElement ??
            //NavigationDetail(element:selectedElement ??
            //SingleDetail(element: selectedElement ??
                userData.elements.sorted(by: { $0.pinyin < $1.pinyin })[0])
        }
        .frame(minWidth: 700, minHeight: 400)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(UserData())
    }
}

