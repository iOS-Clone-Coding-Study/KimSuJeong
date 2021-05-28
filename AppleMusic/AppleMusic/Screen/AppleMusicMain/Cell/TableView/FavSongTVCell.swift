//
//  FavSongTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class FavSongTVCell: UITableViewCell, UICollectionViewDelegate {
    static let identifier = "FavSongTVCell"
    @IBOutlet weak var FavSongCVCell: UICollectionView!
    
    var minItemSpacing: CGFloat = 10
    var song : [SecondRec] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "FavSongTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.FavSongCVCell.register(SecondRecCVCell.nib(), forCellWithReuseIdentifier: SecondRecCVCell.identifier)
        self.FavSongCVCell.contentInsetAdjustmentBehavior = .never
        self.FavSongCVCell.decelerationRate = .fast
        self.FavSongCVCell.delegate = self
        self.FavSongCVCell.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SecondRecCVCell: UICollectionViewDelegate{
}
extension FavSongTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [SecondRec]) {
        self.song = row
        self.FavSongCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return song.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondRecCVCell.identifier, for: indexPath) as? SecondRecCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(playlist: song[indexPath.row])
        return cell
    }
    
}


extension FavSongTVCell: UICollectionViewDelegateFlowLayout{
    
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


