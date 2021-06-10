//
//  StoryTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/01.
//

import UIKit

class StoryTVCell: UITableViewCell {
    
    static let identifier = "StoryTVCell"
    
    // MARK: IBOutlet
    @IBOutlet weak var StoryCVCell: UICollectionView!
    
    var story : [Circle] = []
    
    static func nib() -> UINib{
        return UINib(nibName: "StoryTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell 등록 및 연결
        self.StoryCVCell.register(CircleCVCell.nib(), forCellWithReuseIdentifier: CircleCVCell.identifier)
        
        // DataSource & Delegate
        self.StoryCVCell.dataSource = self
        self.StoryCVCell.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension StoryTVCell: UICollectionViewDelegate{
}

extension StoryTVCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCVCell.identifier, for: indexPath) as? CircleCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(story: story[indexPath.row])
        
        // 스토리 0번 인덱스에만 값 다르게 주기위해 지정
        if(indexPath.row == 0){
            cell.setFirstIndex()
        }
        return cell
    }
    
    func updateCellWith(row: [Circle]) {
        self.story = row
        self.StoryCVCell.reloadData()
    }
}

// MARK: FlowLayout
extension StoryTVCell: UICollectionViewDelegateFlowLayout{
    
    // Cell 사이즈 지정 - 안해주면 셀 안보임!!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width)/5, height: collectionView.frame.height);
    }
    
    // Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    // Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
