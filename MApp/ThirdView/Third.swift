//
//  Third.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI

struct ThirdView: View {
    @State var count = 0
    var body: some View {
        HeartViewOne(Count: $count)
            .onTapGesture {
                count += 1
            }
    }

}

//struct Third_Previews: PreviewProvider {
//    static var previews: some View {
//        ThirdView()
//    }
//}
