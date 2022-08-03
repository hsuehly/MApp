//
//  First.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI

struct FirstView: View {
    @Binding  var Count: Int
    @Binding  var TapNum: Int
    var body: some View {
      

        ZStack {
            HeartViewOne(Count: $Count)
            MoreEmitterView(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//                .ignoresSafeArea(.all)
        }
        .onTapGesture {
            Count +=  5
            TapNum += 1
        }
        //        ZStack {
//            FireworksView()
//        }
    }
}
//
//struct First_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstView()
//    }
//}
