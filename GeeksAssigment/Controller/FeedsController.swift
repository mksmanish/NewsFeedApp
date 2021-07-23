//
//  FeedsController.swift
//  GeeksAssigment
//
//  Created by manish on 22/07/21.
//

import UIKit
import Foundation
import Kingfisher


class FeedsController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var tblViewfeeds: UITableView!
    var arrayNewsItems = [Item]()
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
        self.callDataFromApi()
        
    }
    
    // function to setUp the UI
    func setUp() {
        
        self.tblViewfeeds.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier:Constants.Indentifiers.NewsitemsTableViewCell)
        self.tblViewfeeds.register(UINib(nibName: "NewsFeedLargerCell", bundle: nil), forCellReuseIdentifier:Constants.Indentifiers.NewsitemsLargerTableViewCell)
        
    }
    
    // MARK: General Methods
    
    // function call to get the data
    func callDataFromApi ()
    {
        self.startAnimating()
        let session = URLSession.shared
        let serviceUrl = URL(string:Constants.Urls.ServiceUrl)
        session.dataTask(with: serviceUrl!) { (responseData, responseCode, error) in
            if (error == nil && responseData != nil)
            {
                //parse the response data here
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    do {
                        self.stopAnimating()
                        let result = try decoder.decode(NewsDetails.self, from: responseData!)
                        self.arrayNewsItems = result.items
                        self.tblViewfeeds.reloadData()
                    } catch let error {
                        self.stopAnimating()
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
                
            }
            
        }.resume()
        
    }
    
}

// MARK: TableView datasources and delegates
extension FeedsController: UITableViewDelegate,UITableViewDataSource {
    
    
    // returns the number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNewsItems.count
        
    }
    
    
    // returns the cell to show in tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* since the differentiation parameter for Top and regular is provided that's why they are shown on a
        alternate fashion way */
        
        if indexPath.row % 2 == 0 { // for regular Articles
            let cell = tblViewfeeds.dequeueReusableCell(withIdentifier: Constants.Indentifiers.NewsitemsTableViewCell, for: indexPath) as! NewsitemsTableViewCell
            cell.selectionStyle = .none
            let dateVariable = DateFunctions.sharedInstance
            cell.lblTitle.text = self.arrayNewsItems[indexPath.row].title
            cell.lblDate.text = dateVariable.getDateFromUTC(date: self.arrayNewsItems[indexPath.row].pubDate)
            cell.lblTime.text = dateVariable.getTimeFromUTC(date: self.arrayNewsItems[indexPath.row].pubDate)
            cell.imgPicture.contentMode = .scaleToFill
            cell.imgPicture.adjustsImageSizeForAccessibilityContentSizeCategory = true
            let stringUrl = (self.arrayNewsItems[indexPath.row].thumbnail).replacingOccurrences(of: "&amp;", with: "&")
            let url = URL(string:stringUrl)
            cell.imgPicture.kf.setImage(with: url)
            return cell
        }else { // for the Top Articles
            
            let cell = tblViewfeeds.dequeueReusableCell(withIdentifier: Constants.Indentifiers.NewsitemsLargerTableViewCell, for: indexPath) as! NewsitemsLargerTableViewCell
            cell.selectionStyle = .none

            let dateVariable = DateFunctions.sharedInstance
            cell.lblTitle.text = self.arrayNewsItems[indexPath.row].title
            cell.lblDate.text = dateVariable.getDateFromUTC(date: self.arrayNewsItems[indexPath.row].pubDate)
            cell.lblTime.text = dateVariable.getTimeFromUTC(date: self.arrayNewsItems[indexPath.row].pubDate)
            cell.imgPicture.contentMode = .scaleToFill
            cell.imgPicture.adjustsImageSizeForAccessibilityContentSizeCategory = true
            let stringUrl = (self.arrayNewsItems[indexPath.row].enclosure.thumbnail).replacingOccurrences(of: "&amp;", with: "&")
            let url = URL(string:stringUrl)
            cell.imgPicture.kf.setImage(with: url)
            return cell
            
        }
    }
    // returns the height of the each row in tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return CGFloat(Constants.rowHeight.regularArticle)
        }else {
            
            return CGFloat(Constants.rowHeight.topArticle)
        }
    }
}


