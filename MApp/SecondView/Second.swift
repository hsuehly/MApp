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
    @State private var TisAction = false
 

    var body: some View {
        NavigationView {
            ZStack {
                FireworksView()
               }
            .onChange(of: SisActive, perform: { newValue in
                if newValue {
                    TisAction = true
                }
            })
            NavigationLink(destination: ThirdView(), isActive: $TisAction){
                
            }
            
        }
        .navigationBarBackButtonHidden(true)

    }
}
//
//struct Second_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
