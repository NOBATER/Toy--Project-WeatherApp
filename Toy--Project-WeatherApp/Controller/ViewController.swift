//
//  ViewController.swift
//  Toy--Project-WeatherApp
//
//  Created by 정덕호 on 2022/01/08.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dailyData = WeatherStruct()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIManager.shared.daily { [self] result in
            switch result {
            case .success(let data):
                dailyData.day = data.daily[0].weekday()
                print(dailyData)
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        tableView.layer.borderColor = UIColor.clear.cgColor
        tableView.register(UINib(nibName: "TableViewCell" , bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
        
        
        
        
    }



    
    
    
    
    

    

    
}
    
    
    
//MARK: - TableViewDelegate
//셀 투명도 접근하려고 만든 메서드
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .systemBlue.withAlphaComponent(0.8)
    }
}
    
    
    
    
    

    
    

    
    
    
    
    
    
    



//MARK: -  TableViewDataSource
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.dayLabel.text = dailyData.dayName
            print(dailyData.dayName)
            return cell
            
        }
        
        
    }




