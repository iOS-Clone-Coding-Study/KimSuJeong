//
//  AppleMusicVC.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/10.
//

import UIKit

class AppleMusicVC: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var MainTableView: UITableView!
    @IBOutlet weak var AlbumImageView: UIImageView!
    @IBOutlet weak var playerView: UIVisualEffectView!
    
    var firstArray = FirstData()
    var secondArray = SecondData()
    var thirdArray = ThirdData()
    var fourthArray = FourthData()
    var fifthArray = FifthData()
    var sixthArray = SixthData()
    
    override func viewDidLoad() {
        super.viewDidLoad() // 초기셋팅
        setTVCell()
        setNavigationBar()
        setStyle()
        setDelegate()
    }
    
    // MARK: MainTableView와 Cell 연결
    func setTVCell() {
        self.MainTableView.register(ExploreTVCell.nib(), forCellReuseIdentifier: ExploreTVCell.identifier)
        self.MainTableView.register(PlayListTVCell.nib(), forCellReuseIdentifier: PlayListTVCell.identifier)
        self.MainTableView.register(MoodTVCell.nib(), forCellReuseIdentifier: MoodTVCell.identifier)
        self.MainTableView.register(FavSongTVCell.nib(), forCellReuseIdentifier: FavSongTVCell.identifier)
        self.MainTableView.register(NewMusicTVCell.nib(), forCellReuseIdentifier: NewMusicTVCell.identifier)
        self.MainTableView.register(RecomMusicTVCell.nib(), forCellReuseIdentifier: RecomMusicTVCell.identifier)
        self.MainTableView.register(ContentMoreTVCell.nib(), forCellReuseIdentifier: ContentMoreTVCell.identifier)
    }
    
    // MARK: navigation
    func setNavigationBar() {
        self.navigationItem.title = "둘러보기"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    // MARK: style
    func setStyle() {
        // 이미지 뷰 모서리 둥글게
        AlbumImageView.layer.cornerRadius = 5
        self.MainTableView.layer.masksToBounds = true
        // 테이블 뷰 경계션 없애기
        MainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // MARK: delegate & dataSource
    func setDelegate() {
        MainTableView.delegate = self
        MainTableView.dataSource = self
    }
    
    // MARK: UIView tap gesture
    //    func tapGesture() {
    //        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
    //        self.view.addGestureRecognizer(tapGesture)
    //    }
    //    @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
    //        guard let dvc = self.storyboard?.instantiateViewController(identifier: "PageVC")else{return}
    //        self.present(dvc, animated: true, completion:nil)
    //    }
    
}

extension AppleMusicVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 280
        }else if(indexPath.row == 1){
            return 280
        }else if(indexPath.row == 2){
            return 180
        }else if(indexPath.row == 3){
            return 280
        }else if(indexPath.row == 4){
            return 300
        }else if(indexPath.row == 5){
            return 500
        }else if(indexPath.row == 6){
            return 333
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTVCell.identifier) as? ExploreTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = firstArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayListTVCell.identifier) as? PlayListTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = secondArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodTVCell.identifier) as? MoodTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = thirdArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 3) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FavSongTVCell.identifier) as? FavSongTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = fourthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 4) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecomMusicTVCell.identifier) as? RecomMusicTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = sixthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 5) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewMusicTVCell.identifier) as? NewMusicTVCell else{
                return UITableViewCell()
            }
            //table view cell 내의 collection view에게 데이터 전달
            let rowArray = fifthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }else if(indexPath.row == 6) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentMoreTVCell.identifier) as? ContentMoreTVCell else{
                return UITableViewCell()
            }

            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension AppleMusicVC: UITableViewDelegate{
}
