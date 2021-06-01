## + 혼자 추가로 구현해 본 화면

<img height='600' src="./음악플레이어화면.gif">

## 구현한 기능
1. 음악 플레이 할 수 있도록 오디오 플레이어 연결
    - timeLabel 초기 설정 값을 0이 아닌 해당 음악의 총 재생 길이가 들어가도록 설정
    ```swift
    // 플레이어 초기 설정에 넣어주기
    self.finishTimeLabel.text = setTimeLabel(time: player.duration)

    // 0:00 안에 분:초단위로 들어가게끔 설정
    func setTimeLabel(time:TimeInterval) -> String {
        let min: Int = Int(time/60)
        let sec: Int = Int(time.truncatingRemainder(dividingBy: 60))
            
        let timeTex: String = String(format: "%01ld:%02ld", min, sec)
        return timeTex
    }
    ```
    - 음악이 재생되면 startLabel은 재생 시간만큼 시간이 올라가고 finishLabel은 재생 시간만큼 줄어들도록 설정
    ```swift
    // duration에서 currentTime을 빼주자!
    self.finishTimeLabel.text = setTimeLabel(time: player.duration - player.currentTime)
    ``` 

2. 볼륨 조절 되도록 있도록 연결
    - 플레이어 초기화 시 볼륨 값도 함께 초기화
    ```swift
    self.volumeSlider.maximumValue = volume 
    self.volumeSlider.value = 1.0 
    ```
    - 볼륨 슬라이더 값을 player.volume에 대입
    ```swift
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }
    ```
3. 화면을 아래로 스와이프 할 수 있도록 스와이프 제스쳐 기능
    - 해당 화면을 `right`,`left`,`up`,`down` 원하는 방향으로 스와이프 가능
    ```swift
    // Swipe Back Gesture
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.down
        self.topBar.addGestureRecognizer(swipeRight)
    }
        
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.down:
            self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
    ```