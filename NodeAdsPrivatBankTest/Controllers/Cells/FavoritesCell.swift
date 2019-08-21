//
//  FavoritesCell.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/21/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

  static let reusableId = "FavoritesCell"
  
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
