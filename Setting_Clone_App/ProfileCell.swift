//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by 이상도 on 2023/01/27.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDiscription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 이미지 둥글게
        profileImageView.layer.cornerRadius = 30
        
        
        // Label 설정
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDiscription.textColor = .darkGray
        bottomDiscription.font = UIFont.systemFont(ofSize: 16)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
