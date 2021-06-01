//
//  musicPlayVC.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/31.
//

import UIKit
import AVFoundation

class musicPlayVC: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: Properties
    var player : AVAudioPlayer!
    var timer : Timer!
    let volume : Float = 10.0
    
    // MARK: -IBOutlets
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var finishTimeLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        initializePlayer()
        swipeRecognizer()
    }
    
    // MARK: Style
    func setStyle() {
        // 모서리 둥글게
        albumImage.layer.cornerRadius = 5
        topBar.layer.cornerRadius = 5
    }
    
    // MARK: 플레이어 초기화
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        }
        catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메시지 : \(error.localizedDescription)")
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
        self.finishTimeLabel.text = setTimeLabel(time: player.duration)
        self.volumeSlider.maximumValue = volume
        self.volumeSlider.value = 1.0
    }
    
    // MARK: -Label 업데이트
    // startTimeLabel update
    func updateTimeLabel(time:TimeInterval) {
        let minute: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        
        let timeText: String = String(format: "%01ld:%02ld", minute, second)
        self.startTimeLabel.text = timeText
    }
    
    // finishTimeLabel update
    func setTimeLabel(time:TimeInterval) -> String {
        let min: Int = Int(time/60)
        let sec: Int = Int(time.truncatingRemainder(dividingBy: 60))
        
        let timeTex: String = String(format: "%01ld:%02ld", min, sec)
        return timeTex
    }
    
    // MARK: -타이머
    // 타이머 수행
    func makeTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self] (timer: Timer) in
            if self.progressSlider.isTracking { return }
            self.updateTimeLabel(time: self.player.currentTime)
            self.finishTimeLabel.text = setTimeLabel(time: player.duration - player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    // 타이머 해제
    func stopTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    // MARK: -IBActions
    // 플레이 버튼
    
    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.player?.play()
        }else{
            self.player.pause()
        }
        
        if sender.isSelected{
            self.makeTimer()
        }else{
            self.stopTimer()
        }
    }
    
    // 음악 슬라이더
    @IBAction func sliderChanged(_ sender: UISlider) {
        self.updateTimeLabel(time: TimeInterval(sender.value))
        if sender.isTracking{return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    // 볼륨 슬라이더 값을 player.volume에 대입
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        player.volume = volumeSlider.value
        
    }
    
    // MARK: -오디오 플레이어 Delegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else{
            print("오디오 플레이어 디코드 오류 발생")
            return
        }
        let message: String
        message = "오디오 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default){
            (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 음악이 끝났을 때 설정
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabel(time: 0)
        self.stopTimer()
    }
    
    // MARK: -Swipe Back Gesture
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.down
        self.topBar.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.down:
                // 스와이프 시, 원하는 기능 구현
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
}
