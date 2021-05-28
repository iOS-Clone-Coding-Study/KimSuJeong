//
//  NewMusicTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class NewMusicTVCell: UITableViewCell {
    static let identifier = "NewMusicTVCell"
    
    @IBOutlet weak var NewMusicCVCell: UICollectionView!
    var newsong : [SecondRec] = []
    var minItemSpacing: CGFloat = 10
    
    static func nib() -> UINib {
        return UINib(nibName: "NewMusicTVCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.NewMusicCVCell.register(SecondRecCVCell.nib(), forCellWithReuseIdentifier: SecondRecCVCell.identifier)
        self.NewMusicCVCell.contentInsetAdjustmentBehavior = .never
        self.NewMusicCVCell.decelerationRate = .fast
        self.NewMusicCVCell.delegate = self
        self.NewMusicCVCell.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension NewMusicTVCell: UICollectionViewDelegate{
}
extension NewMusicTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [SecondRec]) {
        self.newsong = row
        self.NewMusicCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsong.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondRecCVCell.identifier, for: indexPath) as? SecondRecCVCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(playlist: newsong[indexPath.row])
        return cell
    }
    
}

extension NewMusicTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-50)/2, height: (collectionView.frame.height-10)/2)
        
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
        let cellWidthIncludeSpacing = (self.NewMusicCVCell.frame.width)-40 + minItemSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
