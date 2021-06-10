//
//  RecomTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/09.
//

import UIKit

class RecomTVCell: UITableViewCell {
    
    static let identifier = "RecomTVCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var RecomCVCell: UICollectionView!
    
    var card : [Card] = []
    
    static func nib() -> UINib{
        return UINib(nibName: "RecomTVCell", bundle: nil)
    }
    
    // MARK: TableView Data
    func setCell(carddata: CardData){
        nameLabel.text = carddata.NameLabel
        moreBtn.setTitle(carddata.MoreBtn, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell 등록 및 연결
        self.RecomCVCell.register(RecomCardCVCell.nib(), forCellWithReuseIdentifier: RecomCardCVCell.identifier)
        
        // DataSource & Delegate
        self.RecomCVCell.dataSource = self
        self.RecomCVCell.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension RecomTVCell: UICollectionViewDelegate {
}

extension RecomTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return card.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomCardCVCell.identifier, for: indexPath) as? RecomCardCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(card: card[indexPath.row])
        return cell
    }
    
    func updateCellWith(row: [Card]) {
        self.card = row
        self.RecomCVCell.reloadData()
    }
}

// MARK: - FlowLayout
extension RecomTVCell: UICollectionViewDelegateFlowLayout{
    
    // Cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width)/2, height: collectionView.frame.height);
    }
    
    // Cell 간의 좌우간격 지정
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
