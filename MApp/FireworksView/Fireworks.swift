//
//  Fireworks.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI
struct Fireworks: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {
//        print("2222")
    }
    
    func makeUIView(context: Context) -> UIView {
        //大小充满整个屏幕
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
           //背景透明
//        view.backgroundColor = .clear
            view.layer.masksToBounds = true
            
            //粒子层
            let emitterLayer = CAEmitterLayer()
            emitterLayer.emitterSize = view.bounds.size // 发射源的尺寸大小
            emitterLayer.emitterShape = .rectangle // 发射源的形状
            emitterLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            emitterLayer.renderMode = .additive
            
            // 烟花种子
            let seedCell = CAEmitterCell()
//            seedCell.color = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2).cgColor
//            seedCell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

            seedCell.redRange = 0.8
            seedCell.greenRange = 0.8
            seedCell.blueRange = 0.8
//            seedCell.lifetime = 20
//            seedCell.birthRate = 16.0
            seedCell.birthRate = 5.0
            seedCell.lifetime = 200
            
            // 烟花
        var cells = [CAEmitterCell]()

        for i in 1 ..< 5 {
            let fireworkCell = CAEmitterCell()
//            let image1 = UIImage(systemName: "heart.fill")?.cgImage
            let image = UIImage(named: "good\(i)_30x30")?.cgImage

//        image1.withTintColor(.red,renderingMode: .alwaysOriginal)
//        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            fireworkCell.contents = image
            fireworkCell.name = "firework"
  

            fireworkCell.alphaRange = 0.1 // 粒子颜色red,green,blue,alpha能改变的范围,默认0
            fireworkCell.lifetime = 10 // 粒子的生命周期,以秒为单位。默认0
//            fireworkCell.lifetimeRange = 10 // 粒子的生命周期的范围，以秒为单位。默认0
            fireworkCell.birthRate = 100 // 粒子的产生率，默认0
            fireworkCell.velocity = 200
            fireworkCell.scale = 0.2 // 缩放比例, 默认是1
            fireworkCell.spin = 3 // 粒子的平均旋转速度，默认是0
            fireworkCell.alphaSpeed = -0.2 // 粒子颜色red,green,blue,alpha在生命周期内的改变速度,默认都是0
            fireworkCell.scaleSpeed = -0.1 // 在生命周期内的缩放速度,默认是0
            fireworkCell.duration = 0.1
            fireworkCell.emissionRange = CGFloat.pi * 2 //发射角度范围,默认0，以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内;
            fireworkCell.yAcceleration = 80 // x,y,z方向上的加速度分量,三者默认都是0
            cells.append(fireworkCell)
        }

            seedCell.emitterCells = cells
            emitterLayer.emitterCells = [seedCell]
            view.layer.insertSublayer(emitterLayer, at: 0)
            return view
        
    }
}
struct FireworksView: View {
//    @Binding var STapNum: Int
    var body: some View {
        ZStack {
                    //背景颜色置黑，模拟夜空
//                    Color.black.ignoresSafeArea()
                    Fireworks()
                        .ignoresSafeArea()
//                        .onTapGesture {
//                            print("+1")
//                            STapNum += 1
//
//                        }

                }
    
    }
}
//
//struct FireworksView_Previews: PreviewProvider {
//    static var previews: some View {
//        FireworksView()
//    }
//}
