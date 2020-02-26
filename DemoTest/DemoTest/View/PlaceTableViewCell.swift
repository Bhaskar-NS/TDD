//
//  PlaceTableViewCell.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 26/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    // Mark: - IBoutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: PlaceCellDataModel) {
        titleLabel.text = model.name
        ratingLabel.text = model.rating
        addressLabel.text = model.address
        statusLabel.text = model.openStatusText
    }

}
