//
//  PlayListTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/10.
//

import UIKit

class PlayListTVCell: UITableViewCell {
    static let identifier = "PlayListTVCell"
    @IBOutlet weak var PlayListCVCell: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
    var playlist : [SecondRec] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayListTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.PlayListCVCell.register(SecondRecCVCell.nib(), forCellWithReuseIdentifier: SecondRecCVCell.identifier)
        self.PlayListCVCell.contentInsetAdjustmentBehavior = .never
        self.PlayListCVCell.decelerationRate = .fast
        self.PlayListCVCell.delegate = self
        self.PlayListCVCell.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
extension PlayListTVCell: UICollectionViewDelegate{
}
extension PlayListTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [SecondRec]) {
        self.playlist = row
        self.PlayListCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlist.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondRecCVCell.identifier, for: indexPath) as? SecondRecCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(playlist: playlist[indexPath.row])
        return cell
    }
    
}

extension PlayListTVCell: UICollectionViewDelegateFlowLayout{
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-50)/2, height: collectionView.frame.height)
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
    
    
    
}
