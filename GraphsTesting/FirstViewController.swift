//
//  ViewController.swift
//  GraphsTesting
//
//  Created by Александр on 07.01.2022.
//

import Charts
import UIKit

class FirstViewController: UIViewController, ChartViewDelegate {

    let barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect (x: 0, y: 0,
                                 width: self.view.frame.size.width / 2,
                                 height: self.view.frame.size.height / 2)
        barChart.center = view.center
        view.addSubview(barChart)
        
        let set = BarChartDataSet(entries: [
            BarChartDataEntry(x: 1 , y: 2),
            BarChartDataEntry(x: 2 , y: 3),
            BarChartDataEntry(x: 4 , y: 4),
            BarChartDataEntry(x: 5 , y: 1)
                                  ])
        let data = BarChartData(dataSets: [set])
        
        barChart.data = data
    }
    
}

