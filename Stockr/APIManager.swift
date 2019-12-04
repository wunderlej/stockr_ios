//
//  APIManager.swift
//  Stockr
//
//  Created by jwunderl on 12/3/19.
//  Copyright © 2019 John Wunderle. All rights reserved.
//

import Foundation

struct APIManager {
    let baseUrl = K.baseURL
    
    let companyData: CompanyData
    
    func fetchData(tickerSymbol: String) -> CompanyData  {
        let url = "\(baseUrl)/\(tickerSymbol)/quote?token=\(K.apiKey)"
        
        return performRequest(urlString: url)
    }
    
    
    func performRequest(urlString: String) -> CompanyData {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error during performRequest")
                    return
                } else {
                    if let safeData = data {
//                        let dataString = String(data: safeData, encoding: .utf8)
//                        print(dataString!)
                        
                        
                        
                        let companyData = try? JSONDecoder().decode(CompanyData.self, from: safeData)
                        
                    }
                }
            }
            
            task.resume()
        }
        return companyData
    }
}
