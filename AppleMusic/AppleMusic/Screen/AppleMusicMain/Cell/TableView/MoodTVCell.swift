//
//  MoodTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class MoodTVCell: UITableViewCell {
    static let identifier = "MoodTVCell"
    
    @IBOutlet weak var MoodCVCell: UICollectionView!
    
    var mood : [ThirdRec] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "MoodTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.MoodCVCell.register(ThirdCVCell.nib(), forCellWithReuseIdentifier: ThirdCVCell.identifier)
        self.MoodCVCell.delegate = self
        self.MoodCVCell.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension MoodTVCell: UICollectionViewDelegate{
}
extension MoodTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [ThirdRec]) {
        self.mood = row
        self.MoodCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mood.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCVCell.identifier, for: indexPath) as? ThirdCVCell else{
            return UICollectionViewCell()
        }
        
        cell.setCell(mood: mood[indexPath.row])
        return cell
    }
    
}

extension MoodTVCell: UICollectionViewDelegateFlowLayout{
    
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
