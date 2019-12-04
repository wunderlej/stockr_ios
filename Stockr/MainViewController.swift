//
//  MainViewController.swift
//  Stockr
//
//  Created by jwunderl on 12/3/19.
//  Copyright © 2019 John Wunderle. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tickerTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    
    
    var apiManager = APIManager()
    
    var companyArray: [String?] = []
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        print("button clicked")
        
        if let ticker = tickerTextField.text {
            let companyData = apiManager.fetchData(tickerSymbol: ticker)
            
            print("data fetched")
            
//            DispatchQueue.main.async {
//                print("in dispatch")
//                self.nameLabel.text = companyData?.companyName
//                self.symbolLabel.text = companyData?.symbol
//            }
            
            
//            if let safeData = companyData {
//
//                print("safe data used")
//                nameLabel.text = safeData.companyName
//                priceLabel.text = String(safeData.latestPrice)
//                symbolLabel.text = safeData.symbol
//            }
            
                self.companyArray = []
                self.companyArray.append(companyData?.companyName)
//            self.companyArray.append(String(companyData!.latestPrice))
               self.companyArray.append(companyData?.latestTime)
                print(self.companyArray)
            
            
            
            
                
//               DispatchQueue.main.async {
//                    print("updating table...")
//                    self.tableView.reloadData()
//
//            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = Auth.auth().currentUser?.displayName
        welcomeLabel.text = "Welcome, \(name ?? "User")!"
        nameLabel.text = ""
        priceLabel.text = ""
        symbolLabel.text = ""
        
//        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension MainViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return companyArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellName, for: indexPath)
//
//        cell.textLabel?.text = "Header"
//        cell.detailTextLabel?.text = companyArray[indexPath.row]
//
//        return cell
//    }
//
//
//}
