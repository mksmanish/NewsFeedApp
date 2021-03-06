//
//  NewsitemsLargerTableViewCell.swift
//  GeeksAssigment
//
//  Created by manish on 23/07/21.
//

import UIKit

// This class represets the cell elements of NewsitemsTableViewCell Cell
class NewsitemsLargerTableViewCell: UITableViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }
    
    /// function used for the setting of UI
    func setupUI() {
        //MARK:- Corner Radius of only two side of UIViews
        imgPicture.clipsToBounds = true
        imgPicture.layer.cornerRadius = 20
        imgPicture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }


}
