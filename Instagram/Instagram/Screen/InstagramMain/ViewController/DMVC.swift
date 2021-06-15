//
//  DMVC.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/13.
//

import UIKit

class DMVC: UIViewController {

    var TabArray = TabData()
    var FourthArray = FourthData()
    
    @IBOutlet weak var MainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setTVCell()
        setStyle()
    }
    
    func setTVCell() {
        self.MainTableView.register(SwipeTabBarTVCell.nib(), forCellReuseIdentifier: SwipeTabBarTVCell.identifier)
        self.MainTableView.register(SearchTVCell.nib(), forCellReuseIdentifier: SearchTVCell.identifier)
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

    
}
extension DMVC: UITableViewDelegate{
}

extension DMVC: UITableViewDataSource{
    // row행 갯수 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // cell 안에 데이터들을 직접 뿌려줌
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwipeTabBarTVCell.identifier) as? SwipeTabBarTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = TabArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }
        if(indexPath.row == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTVCell.identifier) as? SearchTVCell else{
                return UITableViewCell()
            }
            // tableview cell 내 collectionview에게 데이터 전달
            let rowArray = FourthArray.objectsArray
            cell.updateCellWith(row: rowArray)
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    // 각 행 별로 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 50
        }else if(indexPath.row == 1) {
            return 800
        }else{
            return 0
        }
    }
}
