//
//  SwipeTabBarTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/14.
//

import UIKit

class SwipeTabBarTVCell: UITableViewCell {
    
    static let identifier = "SwipeTabBarTVCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SwipeTabBarTVCell", bundle: nil)
    }
    
    @IBOutlet weak var swipeTabBarCVCell: UICollectionView!
    
    var tab : [Tab] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell 등록 및 연결
        self.swipeTabBarCVCell.register(TabBarCVCell.nib(), forCellWithReuseIdentifier: TabBarCVCell.identifier)
        
        // DataSource & Delegate
        self.swipeTabBarCVCell.dataSource = self
        self.swipeTabBarCVCell.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SwipeTabBarTVCell: UICollectionViewDelegate{
}

extension SwipeTabBarTVCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tab.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCVCell.identifier, for: indexPath) as? TabBarCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(tab: tab[indexPath.row])
        return cell
    }
    
    func updateCellWith(row: [Tab]) {
        self.tab = row
        self.swipeTabBarCVCell.reloadData()
    }
}


// MARK: - FlowLayout
extension SwipeTabBarTVCell: UICollectionViewDelegateFlowLayout{
    
    // Cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width)/2, height: collectionView.frame.height);
    }
}

