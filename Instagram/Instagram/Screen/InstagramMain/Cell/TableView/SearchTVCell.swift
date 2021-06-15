//
//  SearchTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/15.
//

import UIKit

class SearchTVCell: UITableViewCell {
    
    static let identifier = "SearchTVCell"

    @IBOutlet weak var searchBar: UISearchBar!
 
    var message : [DM] = []
    
    @IBOutlet weak var SearchCVCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "SearchTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Cell 등록 및 연결
        self.SearchCVCell.register(DMCVCell.nib(), forCellWithReuseIdentifier: DMCVCell.identifier)
        
        // DataSource & Delegate
        self.SearchCVCell.dataSource = self
        self.SearchCVCell.delegate = self
    
    
    }


    
}

extension SearchTVCell: UICollectionViewDelegate{
}

extension SearchTVCell: UICollectionViewDataSource{
    
    func updateCellWith(row: [DM]) {
        self.message = row
        self.SearchCVCell.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return message.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DMCVCell.identifier, for: indexPath) as? DMCVCell else{
            return UICollectionViewCell()
        }
        let rowArray = message[indexPath.row].message
        cell.updateCellWith(row: rowArray)
        
        return cell
    }
}

extension SearchTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-40),height: collectionView.frame.height)
        
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
 
}
