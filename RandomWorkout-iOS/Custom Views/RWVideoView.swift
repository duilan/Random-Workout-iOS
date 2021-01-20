//
//  RWVideoView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 19/01/21.
//

import UIKit
import AVFoundation

class RWVideoView: UIView {
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLayer: AVPlayerLayer?
    private var playbackLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareVideoLoop(name resource: String){
        unloadVideo()
        guard let videoURL = Bundle.main.path(forResource: resource, ofType: "mp4") else {
            print("The \(resource).mp4 video does not exist")
            return
        }
        
        let playerItem = AVPlayerItem(url: URL(fileURLWithPath: videoURL))
        queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: queuePlayer)
        
        guard let playerLayer = self.playerLayer else { return }
        guard let queuePlayer = self.queuePlayer else { return }
        
        playbackLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = self.frame
        self.clipsToBounds = true
        self.layer.addSublayer(playerLayer)
        
    }
    
    func play() {
        queuePlayer?.play()
    }
    
    func stop() {
        queuePlayer?.pause()
    }
    
    func unloadVideo() {
        playerLayer?.removeFromSuperlayer()
        playerLayer = nil
        queuePlayer = nil
        playbackLooper = nil
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        playerLayer?.frame = self.bounds
    }
    
}
