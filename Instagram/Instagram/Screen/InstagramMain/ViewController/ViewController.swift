//
//  ViewController.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Data
    var firstArray = FirstData()
    var secondArray = SecondData()
    var secondTVArray = SecondTVData()
    var thirdArray = ThirdData()
    var thirdTVArray = ThirdTVData()
    var fifthArray = FifthData()
    var fifthTVArray = FifthTVData()
    
    
    // MARK: IBOutlet
    @IBOutlet weak var MainTableView: UITableView!
    @IBOutlet weak var directMessage: UIButton!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTVCell()
        setDelegate()
        setStyle()
        swipeGesture()
    }
    
    // MARK: Cell 등록
    func setTVCell() {
        self.MainTableView.register(StoryTVCell.nib(), forCellReuseIdentifier: StoryTVCell.identifier)
        self.MainTableView.register(FriendsTVCell.nib(), forCellReuseIdentifier: FriendsTVCell.identifier)
        self.MainTableView.register(RecomTVCell.nib(), forCellReuseIdentifier: RecomTVCell.identifier)
    }
    
    // MARK: Delegate & DataSource
    func setDelegate() {
        MainTableView.delegate = self
        MainTableView.dataSource = self
    }
    
    // MARK: Style
    func setStyle() {
        // Tableview 선 제거
        MainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // MARK: UIView swipe gesture
    func swipeGesture() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        swipeRecognizer.direction = .right
        self.MainTableView.addGestureRecognizer(swipeRecognizer)
    }

@objc func swipeAction(_ sender :UISwipeGestureRecognizer){
        if sender.direction == .right{
            guard let dvc = self.storyboard?.instantiateViewController(identifier: "DMVC")else{return}
                    self.present(dvc, animated: false, completion:nil)
        }

    }

    

    @IBAction func directMessage(_ sender: UIButton) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "DMVC")else{return}
                self.present(dvc, animated: false, completion:nil)
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
    }
    
}

extension ViewController: UITableViewDelegate{
}

extension ViewController: UITableViewDataSource{
    // row행 갯수 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // cell 안에 데이터들을 직접 뿌려줌
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryTVCell.identifier) as? StoryTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = firstArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTVCell.identifier) as? FriendsTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = secondArray.objectsArray
            cell.updateCellWith(row: rowArray)
            cell.pageControlInitLayout()
            
            // tableview 내 데이터 전달
            // 전달 데이터가 하나라서 0번째 것만 뿌려줌
            let dataTV = secondTVArray.objectsArray
            cell.setCell(data: dataTV[0])
            
            return cell
        }else if(indexPath.row == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecomTVCell.identifier) as? RecomTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = thirdArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            // tableview 내 데이터 전달
            // 전달 데이터가 하나라서 0번째 것만 뿌려줌
            let carddataTV = thirdTVArray.objectsArray
            cell.setCell(carddata: carddataTV[0])
            
            return cell
        }else if(indexPath.row == 3) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTVCell.identifier) as? FriendsTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = fifthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            cell.pageControlInitLayout()
            
            // tableview 내 데이터 전달
            // 전달 데이터가 하나라서 0번째 것만 뿌려줌
            let dataTV = fifthTVArray.objectsArray
            cell.setCell(data: dataTV[0])
            
            return cell
        }
        
        else{
            return UITableViewCell()
        }
    }
    
    // 각 행 별로 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 105
        }else if(indexPath.row == 1) {
            return 600
        }else if(indexPath.row == 2) {
            return 330
        }else if(indexPath.row == 3) {
            return 600
        }else{
            return 0
        }
    }
}


