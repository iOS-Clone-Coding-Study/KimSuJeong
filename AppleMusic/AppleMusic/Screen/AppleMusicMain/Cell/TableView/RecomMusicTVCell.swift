//
//  RecomMusicTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/13.
//

import UIKit

class RecomMusicTVCell: UITableViewCell {
    static let identifier = "RecomMusicTVCell"
    @IBOutlet weak var RecomMusicCVCell: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
    var songs : [Recom] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "RecomMusicTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.RecomMusicCVCell.register(FifthCVCell.nib(), forCellWithReuseIdentifier: FifthCVCell.identifier)
        self.RecomMusicCVCell.contentInsetAdjustmentBehavior = .never
        self.RecomMusicCVCell.decelerationRate = .fast
        self.RecomMusicCVCell.delegate = self
        self.RecomMusicCVCell.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension RecomMusicTVCell: UICollectionViewDelegate{
}

extension RecomMusicTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [Recom]) {
        self.songs = row
        self.RecomMusicCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FifthCVCell.identifier, for: indexPath) as? FifthCVCell else{
            return UICollectionViewCell()
        }
        let rowArray = songs[indexPath.row].songs
        cell.updateCellWith(row: rowArray)
        
        return cell
    }
}

extension RecomMusicTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-40),height: collectionView.frame.height)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    //MARK: Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let cellWidthIncludeSpacing = (self.RecomMusicCVCell.frame.width)-40 + minItemSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
