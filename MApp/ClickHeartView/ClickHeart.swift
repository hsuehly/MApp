//
//  ClickHeart.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//
//import SwiftUI
//
//struct HeartView: View {
//
//    public let id = UUID()
//
//    public var hit:CGPoint = CGPoint()
//
//    @State var isAnimation:Bool = false{
//        didSet{
//            if !isAnimation {
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
//                    withAnimation{
//                        isAnimation = false
//                    }
//                })
//            }
//        }
//    }
//
//    var onHide: ((_ heart:HeartView)->Void)? = nil
//
//    public var wh:CGFloat =  CGFloat.random(in: 30 ... 100){
//        didSet{
//            print(wh)
//        }
//    }
//
//    var body: some View{
//        HeartShape()
//            .fill(Color.red)
//            .frame(width: 100, height: 100)
//            .rotationEffect(Angle(degrees: Double(Int.random(in: -60 ... -30))))
//            .scaleEffect(isAnimation ? 2:0)
//            .opacity(isAnimation ? 0.6:0)
//            .onAppear{
//                withAnimation{
//                    isAnimation = true
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
//                    withAnimation{
//                        isAnimation = false
//                    }
//                })
//            }
//    }
//
//}
//
//struct HeartShape : Shape {
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.addPath(Rectangle().path(in: rect))
//
//        let circleRectLeft = CGRect(x: 0, y: -(rect.height / 2), width: rect.width, height: rect.height)
//
//        path.addPath(Circle().path(in: circleRectLeft))
//
//        let circleRectRight = CGRect(x: (rect.height / 2), y: 0, width: rect.width, height: rect.height)
//
//        path.addPath(Circle().path(in: circleRectRight))
//
//        return path
//    }
//}
//
//struct ClickHeart: View {
//
//    @State private var heartList:[HeartView] = []
//
//    @State var hit:CGPoint  = CGPoint()
//
//    var body: some View {
//
//        ZStack{
//            Rectangle()
//                .fill(Color.white)
////                .allowsHitTesting({ (p) -> Bool in
////                    hit = p
////                    return true
////                })
////                .hitTest({ (p) -> Bool in
////                    hit = p
////                    return true
////                })
//                .frame(height: 500)
//                .onTapGesture(count: 2, perform: {
//                    var heart = HeartView(){ heart in
//                        heartList.removeAll(where: { item in
//                            heart.id == item.id
//                        })
//                    }
//
//                    heart.hit = hit
//
//                    heartList.append(heart)
//                })
//
//
//            ForEach(0..<heartList.count, id: \.self) { (index) -> AnyView in
//                let heart =  heartList[index]
//
//                return  withAnimation{
//                    heart
//                        .offset(x:heart.hit.x - (100 * 2),y:heart.hit.y - (100 * 2)) as! AnyView
////                        .eraseToAnyView()
//
//                }
//            }
//        }.frame(height: 800)
//
//    }
//}
//
//struct ClickHeart_Previews: PreviewProvider {
//    static var previews: some View {
//        ClickHeart()
//    }
//}
