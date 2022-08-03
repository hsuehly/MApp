//
//  HeartBeat.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI
struct HeartBeat: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        /// 红心跳动
        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        let heartImage = UIImageView(image: imageIcon)
            let k = CAKeyframeAnimation(keyPath: "transform.scale")
            k.values = [0.9, 1.0,1.1]
            k.keyTimes = [0.0, 0.2, 0.6, 0.8, 1.0]
            k.calculationMode = .linear
            k.repeatCount = 1000
            k.autoreverses = true
            k.duration = 1
            heartImage.layer.add(k, forKey: "SHOW")
        print("ddd")
        //1.创建动画对象
//            let anim = CABasicAnimation()
//
//            //2.设置动画属性
//            anim.keyPath = "transform.scale";
//            anim.toValue = 0;
//
//            //设置动画执行的次数
//            anim.repeatCount = MAXFLOAT;
//            //设置动画的执行时间
//            anim.duration = 0.25;
//
//            //自动反转(怎么去怎么回)
//            anim.autoreverses = true;
//            //添加动画
//            heartImage.layer.add(anim, forKey: nil)
            return heartImage
    
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        print("ooo")
        print(uiView.frame)
    }

    typealias UIViewType = UIView
}

struct HeartBeatView: View {
    var body: some View {
        
        ZStack {
            HeartBeat()
        }
        .frame(width: 120, height: 120)
        

    }
}

struct HeartBeat_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeartBeatView()
        }
     
    }
}
