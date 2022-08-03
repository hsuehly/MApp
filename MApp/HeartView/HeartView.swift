//
//  HeartView.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI
// 爱心
struct LoveGeometryEffect: GeometryEffect {
    var time: Double
    var apeed = Double.random(in: 100 ... 200)
    var xDirection = Double.random(in: -0.1 ... 0.1)
    var yDirection = Double.random(in: -Double.pi ... 0)
    var animatableData: Double {
        get {time}
        set {time = newValue}
        
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = apeed * xDirection
        let yTranslation = apeed * sin(yDirection) * time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
// 视图修饰
struct TapModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.red)
                .modifier(LoveGeometryEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
            
        }
        .onAppear {
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
struct HeartViewOne: View {
    @Binding var Count: Int
//    func TapAction () {
//        self.Count +=  1
//    }
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 40){
                ZStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 120, height: 120)
                        .padding()
//                        .onTapGesture {
//                            self.TapAction()
//                        }
                    ForEach( 0 ..< self.Count, id: \.self) {_ in
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .modifier(TapModifier())
                            .padding()
                        
                    }
                }
            }
        }
  
    }
}
//struct HeartView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeartView(Count: )
//    }
//}
