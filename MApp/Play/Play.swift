//
//  Play.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/30.
//
import AVFoundation

class PlayMusic {
    //播放完成回调
    //flag              YES播放完成, NO播放失败
    typealias CompletePlayingBlock =  (_ flag:Bool) -> ()
    var player: AVPlayer?
    // 循环播放
    //    var player = AVQueuePlayer()
    var playerItem: AVPlayerItem?
    var looper: AVPlayerLooper?
    var completePlayBlock:CompletePlayingBlock?
    //    var url: String
    var playUrl: [String]?
    var playLen = 0
    
    // 当前播放的歌曲
    private var _playIndex = 0
    var playIndex: Int  {
        get {
            return self._playIndex
        }
        set {
            if newValue > self.playLen {
                self._playIndex = 0
                return
            }
            self._playIndex = newValue
        }
    }   // 歌曲长度
    
    init (urls: [String]) {
        //        self.url = url
        self.playUrl = urls
        self.playLen = urls.count - 1
        do {
            let audioSession = AVAudioSession.sharedInstance()
            _ = try audioSession.setCategory(.playback, options: .defaultToSpeaker)
            _ = try audioSession.setActive(true)
            //           let _  = try session.setCategory(.playback, mode: .default, options:.defaultToSpeaker)
            //            try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch {
            // report for an error
            print(error)
        }
        //        self.looper = AVPlayerLooper(player: player, templateItem: playerItem!)
        self.addObserverForPlayer()
        
    }
    func playInit () {
        self.playerItem = AVPlayerItem(url: URL(string: self.playUrl![self.playIndex])!)
        self.player = AVPlayer(playerItem: playerItem!)
        
        self.player?.play()
    }
    func play () {
        self.player?.play()
    }
    func pause () {
        self.player?.pause()
    }
    //播放完毕
    func addObserverForPlayer() {
        NotificationCenter.default.addObserver(self, selector: #selector(audioPlayCompletion), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    //MARK:播放完毕
    @objc func audioPlayCompletion() {
        if self.player?.currentItem?.status == AVPlayerItem.Status.readyToPlay {
            self.player?.seek(to: CMTime.zero) { finished in
                //                print(finished,"finished")
                self.playIndex += 1
                self.playInit()
                self.play()
                //                self.completePlayBlock?(true)
            }
        }
    }
    //MARK:改变播放进度
    func changeAudio(currentTime:Float64) {
        if currentTime>0 {
            let time:CMTime = CMTimeMakeWithSeconds(currentTime, preferredTimescale: 1 * Int32(NSEC_PER_SEC))
            self.player?.seek(to: time, toleranceBefore: CMTime.zero, toleranceAfter:CMTime.zero)
            self.player?.play()
        }
    }
    
    func prt () {
        //        print(self.player?.currentItem?.status)
    }
}
