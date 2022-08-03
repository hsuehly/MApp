//
//  Second.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack {
//            Color.black.ignoresSafeArea()
//            HeartBeatView()
            FireworksView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Second_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
