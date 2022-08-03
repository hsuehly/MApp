//
//  MAppApp.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/29.
//

import SwiftUI

@main
struct MAppApp: App {
    @Environment(\.scenePhase) private var scenePhase
//    var player = PlayMusic(url: "https://img.yangtuyun.cn/nswdyq.mp3")
//    var playUrl:[String] = ["https://img.yangtuyun.cn/nswdyq.mp3","https://img.yangtuyun.cn/bhypgn.mp3"]
// ["https://img.yangtuyun.cn/nswdyq.mp3","https://img.yangtuyun.cn/bhypgn.mp3"]
    var player = PlayMusic(urls: ["https://img.yangtuyun.cn/nswdyq.mp3"])
    // https://img.yangtuyun.cn/bhypgn.mp3
    init() {
        self.player.playInit()
        
    }
//    let player = Play()
    var body: some Scene {
        WindowGroup {
            ContentView()
//            Button {
//                self.player.changeAudio(currentTime: 100)
//            } label: {
//                Text("改变进度")
//            }


        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active :
                print("App active")
            case .inactive :
                self.player.play()
                print("App inactive")
            case .background :
                self.player.pause()
                print("App background")
            @unknown default :
                print("Others")
            }
        }

    }
}
