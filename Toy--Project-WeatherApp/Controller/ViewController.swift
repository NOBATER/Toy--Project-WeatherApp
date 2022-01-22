//
//  ViewController.swift
//  Toy--Project-WeatherApp
//
//  Created by 정덕호 on 2022/01/08.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var dailyData: [Daily] = []
    
    var weatherStruct = WeatherStruct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        APIManager.shared.daily { [self] result in
            switch result {
            case .success(let data):
                
                
                DispatchQueue.main.async {
                    dailyData = data.daily
                    dailyData.removeLast()
                    tableView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        tableView.layer.borderColor = UIColor.clear.cgColor
        tableView.register(UINib(nibName: "TableViewCell" , bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowRadius = 10
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
        
        
        
        weatherImage.image = UIImage(named: "cloud")

    }




    
}
    
    
    
//MARK: - TableViewDelegate
//셀 투명도 접근하려고 만든 메서드
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .systemGray.withAlphaComponent(0.2)
        
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = " 🗓   7일간의 일기예보"
        
            label.font = .systemFont(ofSize: 16)
            label.textColor = .white
            
            headerView.addSubview(label)
            
 
        
            return headerView
        }
    

    
  
    
    
}
    
    

//MARK: -  TableViewDataSource
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dailyData.count
        }
        
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            let dailyData = dailyData[indexPath.row]
            cell.imageLabel.tintColor = .white
            cell.tempLabel.textColor = .white
            cell.dayLabel.textColor = .white
            weatherStruct.day = dailyData.weekday()
            weatherStruct.min = dailyData.temp.min
            weatherStruct.max = dailyData.temp.max
            weatherStruct.id = dailyData.weather[0].id
            cell.dayLabel.text = weatherStruct.dayName
            cell.tempLabel.text = "\(Int(weatherStruct.min)) | \(Int(weatherStruct.max))"
            cell.imageLabel.image = UIImage(systemName: weatherStruct.conditionName)
            
            
            
            
            
            return cell
            
        }
        
 
        
        
    }





