//
//  ExploreTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/10.
//

import UIKit

class ExploreTVCell: UITableViewCell {
    static let identifier = "ExploreTVCell"
    
    @IBOutlet weak var ExploreCVCell: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
    var explore : [FirstRec] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "ExploreTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.ExploreCVCell.register(FirstRecCVCell.nib(), forCellWithReuseIdentifier: FirstRecCVCell.identifier)
        self.ExploreCVCell.contentInsetAdjustmentBehavior = .never
        self.ExploreCVCell.decelerationRate = .fast // 감속도를 결정하는 부동소수점 값
        self.ExploreCVCell.delegate = self
        self.ExploreCVCell.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension ExploreTVCell: UICollectionViewDelegate{
}

extension ExploreTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [FirstRec]) {
        self.explore = row
        self.ExploreCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return explore.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstRecCVCell.identifier, for: indexPath) as? FirstRecCVCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(explore: explore[indexPath.item])
        return cell
    }
}

extension ExploreTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-40, height: collectionView.frame.height)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    //
    //MARK: - Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let cellWidthIncludeSpacing = (self.ExploreCVCell.frame.width)-40 + minItemSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
