//
//  Second.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI

struct SecondView: View {
    @Binding  var STapNum: Int
    @Binding var SisActive: Bool

    var body: some View {
//        NavigationView {
            ZStack {
                FireworksView()
               }
            NavigationLink(destination: ThirdView(), isActive: $SisActive){
                
            }
            
//        }
        .navigationBarBackButtonHidden(true)

    }
}
//
//struct Second_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
