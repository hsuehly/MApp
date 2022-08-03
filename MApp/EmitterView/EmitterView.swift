//
//  EmitterView.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//

import SwiftUI

struct MoreEmitterView: UIViewRepresentable {
    var size: CGSize
    func makeUIView(context: Context) -> UIView {
//        let size = CGSize(width: 824.0, height: 1112.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
//        host.backgroundColor = .black

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        // 3.开启三维效果
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor.clear.cgColor //UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterShape = .circle
//        particlesLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast
        var cells = [CAEmitterCell]()
        for i in 0..<12 {
            // 4.1.创建例子Cell
            let cell = CAEmitterCell()
            cell.name = "Snow"
            cell.birthRate = 16.0
            cell.lifetime = 20.0
            cell.velocity = 59.0
            cell.velocityRange = -15.0
            cell.xAcceleration = 5.0
            cell.yAcceleration = 40.0
            cell.emissionRange = 180.0 * (.pi / 180.0)
            cell.spin = -28.6 * (.pi / 180.0)
            cell.spinRange = 57.2 * (.pi / 180.0)
            cell.scale = 0.06
            cell.scaleRange = 0.3
            cell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            
            // 4.7.设置粒子展示的图片
            let image = UIImage(named: "good\(i)_30x30")?.cgImage

         
            cell.contents = image
            
            // 4.8.添加到数组中
            cells.append(cell)
        }
        // 5.将粒子设置到发射器中
        particlesLayer.emitterCells = cells
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print("11111")
    }

    typealias UIViewType = UIView
}
struct MoreEmitterView_Previews: PreviewProvider {
    static var previews: some View {
        MoreEmitterView(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            .ignoresSafeArea(.all)
    }
}
