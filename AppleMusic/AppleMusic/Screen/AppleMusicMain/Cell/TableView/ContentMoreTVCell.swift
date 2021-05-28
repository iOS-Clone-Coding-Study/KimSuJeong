//
//  ContentMoreTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/17.
//

import UIKit

class ContentMoreTVCell: UITableViewCell {
    static let identifier = "ContentMoreTVCell"
    
    @IBOutlet weak var contentMoreTV: UITableView!
    var more = ["카테고리 둘러보기", "인기 차트", "휴식", "대표곡", "키즈 & 패밀리"]
    
    static func nib() -> UINib {
        return UINib(nibName: "ContentMoreTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentMoreTV.dataSource = self
        contentMoreTV.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "CategoryTVCell", bundle: nil)
        self.contentMoreTV.register(cellNib, forCellReuseIdentifier: CategoryTVCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension ContentMoreTVCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTVCell.identifier) as? CategoryTVCell {
            let titleString = more[indexPath.row]
            print(titleString)
            cell.setCell(title: titleString)
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ContentMoreTVCell: UITableViewDelegate {
}

