//
//  ViewController.swift
//  tableViewApi
//
//  Created by champis on 28/3/2562 BE.
//  Copyright © 2562 sdfler. All rights reserved.
//

import UIKit
struct ExchageRate: Decodable{
    let base: String
    let date: String
    let rates: dd
}
struct dd: Decodable{
    let BGN: Double
    let NZD: Double
}
struct jsonstruct:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
    let population: Int
    
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let list = ["Milk", "Honey", "Bread", "Tacos", "Tomatoes"]
    var testNa = [jsonstruct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
//        getdataaa()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getdata(){
        let jsonUrlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, responds,err) in
            guard let data = data else {return}
            do {
//                let exchangeList = try JSONDecoder().decode(jsonstruct.self, from: data)
//                print(exchangeList.base,": ",exchangeList.date,": ",exchangeList.rates)
                self.testNa = try JSONDecoder().decode([jsonstruct].self, from: data)
                print(self.testNa)
//                for mainarr in self.testNa{
//                    print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
//
                //}
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testNa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.textName.text = "Name : \(testNa[indexPath.row].name)"
        cell.textCapital.text = "Capital : \(testNa[indexPath.row].capital)"
        cell.textRegion.text = "Region : \(testNa[indexPath.row].region)"
        cell.population.text = "Population : \(testNa[indexPath.row].population)"
        //return cell
        //        cell.textLabel?.text = list[indexPath.row]
//        cell.textLabel?.text = "Name : \(testNa[indexPath.row].name)"
//        cell?.text = "Region :\(testNa[indexPath.row].region)"
//        cell.textLabel?.text = "SubRegion :\(testNa[indexPath.row].subregion)"
//        cell.textLabel?.text = "Alpha3code :\(testNa[indexPath.row].alpha3Code)"
//        cell.textLabel?.text = "Alpha2code :\(testNa[indexPath.row].alpha2Code)"
        return(cell)
    }
//    func getdataaa(){
//        let jsonUrlString = "https://api.exchangeratesapi.io/latest?base=THB"
//        guard let url = URL(string: jsonUrlString) else {return}
//        URLSession.shared.dataTask(with: url) { (data, responds,err) in
//            guard let data = data else {return}
//            do {
//                self.testNa = try JSONDecoder().decode([dd].self, from: data)
//                print(self.testNa)
//            } catch let jsonErr {
//                print("Error serializing json", jsonErr)
//            }
//            }.resume()
//    }

}

