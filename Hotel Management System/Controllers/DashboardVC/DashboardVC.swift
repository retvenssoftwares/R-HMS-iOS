//
//  DashboardVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 20/11/23.
//

import UIKit
import PieCharts
import Charts


class DashboradVC: UIViewController, ChartViewDelegate {
    
    
    
    
    // MARK: - Outlet

   
   
    @IBOutlet weak var btnReportsAndLogs: UIButton!
    @IBOutlet weak var lblReportsAndLog: CustomLabel!
    @IBOutlet weak var viewReportsAndLogs: UIView!
    @IBOutlet weak var btnBooking: UIButton!
    @IBOutlet weak var lblBooking: UILabel!
    @IBOutlet weak var viewBookingBtn: UIView!
    @IBOutlet weak var btnChannelAndMaping: UIButton!
    @IBOutlet weak var lblChannelAndMaping: UILabel!
    @IBOutlet weak var viewChannelAndMappingbtn: UIView!
    @IBOutlet weak var btnCreateReservation: UIButton!
    @IBOutlet weak var lblCreateReservation: UILabel!
    @IBOutlet weak var viewCreateReservation: UIView!
    @IBOutlet weak var btnRatesAndInventory: UIButton!
    @IBOutlet weak var lblRatesAndInventory: UILabel!
    @IBOutlet weak var viewRateAndInventoryBtn: UIView!
    @IBOutlet weak var btnDashboard: UIButton!
    @IBOutlet weak var lblDashboard: UILabel!
    @IBOutlet weak var viewDashboardBtn: UIView!
    @IBOutlet weak var viewSideMenu: UIView!
    @IBOutlet weak var btnSubmenu: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var barChartViews: BarChartView!
    @IBOutlet weak var lblArrivals: UILabel!
    @IBOutlet weak var lblNoArrivals: UILabel!
    @IBOutlet weak var progressBarArrivals: UIProgressView!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblOccupancy: UILabel!
    @IBOutlet weak var lblNoOccupancy: UILabel!
    @IBOutlet weak var lblDepartues: UILabel!
    @IBOutlet weak var lblNoDepartues: UILabel!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var piechartOccupancy: PieChartView!
    @IBOutlet weak var viewInventoryPicChart: PieChartView!
    @IBOutlet weak var revenueLineChart: LineChartView!
    @IBOutlet weak var progressBarDepartues: UIProgressView!
    @IBOutlet weak var lblNoRevPAR: UILabel!
    @IBOutlet weak var lblNoAvgLOS: UILabel!
    @IBOutlet weak var lblNoAvgLeadTime: UILabel!
    @IBOutlet weak var dashboardTableView: UITableView!
    var showValues: Bool = false
    var  circle = CGSize(width: 200, height: 200)
    var barChartValues: [[CGFloat]] = []
    var designations: [Designation] = []
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    fileprivate var currentColorIndex = 0
    
    
    var receivedDate1: String = ""
    var receivedDate2: String = ""
    var receivedDate3: String = ""
    var receivedDate4: String = ""
    var receivedDate5: String = ""
    
    var months: [String]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSideMenu.isHidden = true
        dashboardTableView.register(UINib(nibName: "DashboardTableCell", bundle: nil), forCellReuseIdentifier: "DashboardTableCell")

        
        //fetchDataAndUpdateChart()
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.enabled = false
        barChartView.legend.enabled = false
        barChartView.leftAxis.enabled = true
        animateChartUpdate()
        setupLineChart()
//        viewSideMneu.isHidden = true
//        sideMenuTableView.register(UINib(nibName: "SideMenuTableCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableCell")
//        viewSideMneu.isHidden = true
        
        months = [receivedDate1, receivedDate2, receivedDate3, receivedDate4, receivedDate5]
        let dominanz1 = [1.0, 2.0, 3.0, 4.0, 5.0]
        let dominanz2 = [5.0, 4.0, 3.0, 2.0, 1.0]
        let customColors: [UIColor] = [
                    UIColor(red: 49/255, green: 27/255, blue: 146/255, alpha: 1),
                    UIColor(red: 255/255, green: 70/255, blue: 108/255, alpha: 1),
                    UIColor(red: 120/255, green: 190/255, blue: 32/255, alpha: 1),
                    UIColor(red: 255/255, green: 193/255, blue: 7/255, alpha: 1),
                    UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1)
                ]
        setChartBarGroupDataSet(dataPoints: months, values: dominanz1, values2: dominanz2, colors: customColors)
        
        //createBarChart(stacked: true, yAxisInverted: false)
        updateOccupancyChartWithData()
        let unitsSold: [Double] = [11011011111110, 8011100, 7111500, 3111300, 1411000, 15000, 6000, 1000, 18000, 19000, 20000, 21000]
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        barCheck()
        nightRevenueChart()
        setupPieChartData()
        updateChartData()
        updateChartWithMockData()
        updateInventoryChartWithData()
        //nightRevenueStackPlot()
        
    }
    
    func setChartBarGroupDataSet(dataPoints: [String], values: [Double], values2: [Double], colors: [UIColor]) {
            var dataEntries: [BarChartDataEntry] = []
            var dataEntries2: [BarChartDataEntry] = []

            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
                dataEntries.append(dataEntry)
            }

            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values2[i]])
                dataEntries2.append(dataEntry)
            }

            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "DataSet 1")
            let chartDataSet2 = BarChartDataSet(entries: dataEntries2, label: "DataSet 2")

            // Assign custom colors
            chartDataSet.colors = colors.prefix(dataPoints.count).map { NSUIColor(cgColor: $0.cgColor) }
            chartDataSet2.colors = colors.suffix(dataPoints.count).map { NSUIColor(cgColor: $0.cgColor) }

            let groupSpace = 0.3
            let barSpace = 0.05
            let barWidth = 0.35

            let groupCount = dataPoints.count
            let groupWidth = barWidth + barSpace
            let barWidthWithSpace = barWidth + barSpace

            let barChartData = BarChartData(dataSets: [chartDataSet, chartDataSet2])
            barChartData.barWidth = barWidthWithSpace
            barChartViews.xAxis.axisMinimum = Double(0)
            barChartViews.xAxis.axisMaximum = Double(0) + barChartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
            barChartData.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)

            barChartViews.data = barChartData

            // Additional customization if needed
            //barChartView.descriptionText = ""
            barChartViews.rightAxis.enabled = false
            barChartViews.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutBounce)
        }
    private func assignColors(for colors: [NSUIColor], count: Int) -> [NSUIColor] {
        guard colors.count >= count else {
            fatalError("Insufficient colors in ChartColorTemplates.material()")
        }
        
        var assignedColors: [NSUIColor] = []
        
        for i in 0..<count {
            assignedColors.append(colors[i % colors.count])
        }
        
        return assignedColors
    }
    
    func reloadDatasets() {
        // BARCHART
        barChartValues = [
            (0..<6).map { _ in .random(in: 20...200) },
            (0..<6).map { _ in .random(in: 20...200) }
        ]
        
    }
    
    //MARK: need to add url
    //    func fetchDataAndUpdateChart() {
    //            // Simulate API call, replace this with your actual API call
    //            DispatchQueue.global().async {
    //                // Replace this URL with your API endpoint
    //                let apiUrl = URL(string: "")!
    //
    //                do {
    //                    let data = try Data(contentsOf: apiUrl)
    //                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
    //
    //                    // Process JSON data and update chart on the main thread
    //                    DispatchQueue.main.async {
    //                        self.updateChartWithData(jsonData: jsonData)
    //                        self.animateChartUpdate()
    //                    }
    //                } catch {
    //                    print("Error fetching or parsing data: \(error)")
    //                }
    //            }
    //        }
    
    
    //MARK: night revenue
    func nightRevenueChart() {
        
    }
    
    
    func barCheck()
    {
        let values: [BarChartDataEntry] = [
            BarChartDataEntry(x: 1.0, y: 100000.0),
            BarChartDataEntry(x: 2.0, y: 200000.0),
            BarChartDataEntry(x: 3.0, y: 300000.0),
            BarChartDataEntry(x: 4.0, y: 400000.0),
            BarChartDataEntry(x: 5.0, y: 500000.0),
            BarChartDataEntry(x: 6.0, y: 100000.0),
            BarChartDataEntry(x: 7.0, y: 200000.0),
            BarChartDataEntry(x: 8.0, y: 300000.0),
            BarChartDataEntry(x: 9.0, y: 400000.0),
            BarChartDataEntry(x: 10.0, y: 500000.0),
            BarChartDataEntry(x: 11.0, y: 100000.0),
            BarChartDataEntry(x: 12.0, y: 200000.0),
        ]
        
        let dataSet = BarChartDataSet(entries: values, label: "Bar Chart")
        dataSet.colors = [NSUIColor.blue] // Customize the bar color as needed
        
        let data = BarChartData(dataSet: dataSet)
        
        // Customize the chart appearance
        barChartView.data = data
        // Customize the y-axis range based on your data
        let yaxis = barChartView.leftAxis
        yaxis.axisMinimum = 0.0
        yaxis.axisMaximum = 6.0 // Adjust based on your data range
        
        let customYAxisValues = ["1 Lakh", "2 Lakh", "3 Lakh", "4 Lakh", "5 Lakh"]
        barChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: customYAxisValues)
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Jan", "Feb", "Mar", "Apr", "May"])
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.labelRotationAngle = 0
        
        // Customize other chart settings
        barChartView.legend.enabled = false
        barChartView.rightAxis.enabled = false
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        
    }
    
    //    func nightRevenueStackPlot() {
    //        let multicolorValues: [MulticolorBarChartDataEntry] = [
    //                    MulticolorBarChartDataEntry(x: 1.0, yValues: [50, 30, 20], colors: [.red, .green, .blue]),
    //                    MulticolorBarChartDataEntry(x: 2.0, yValues: [40, 50, 10], colors: [.orange, .purple, .cyan]),
    //                ]
    //
    //                // Create data set for multicolor bar chart
    //                let dataSet = BarChartDataSet(entries: multicolorValues, label: "Multicolor Bar")
    //
    //                // Combine datasets in a BarChartData object
    //                let data = BarChartData(dataSets: [dataSet])
    //
    //                // Customize the chart appearance
    //                barChartView.data = data
    //        barChartView.chartDescription.text = "Multicolor Bar Chart"
    //                barChartView.legend.enabled = true
    //
    //                // Customize other settings as needed
    //                barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Label 1", "Label 2"])
    //                barChartView.xAxis.labelPosition = .bottom
    //                barChartView.xAxis.labelRotationAngle = -45
    //                barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    //
    //                // Customize bar colors directly
    //                for (index, entry) in multicolorValues.enumerated() {
    //                    let colors = entry.colors
    //                    let dataSetEntry = dataSet.entryForIndex(index) as? BarChartDataEntry
    //
    //                    dataSet.colors = multicolorValues.flatMap { $0.colors }
    //                }
    //
    //
    //    }
    
    func updateChartWithMockData() {
        let mockData: [Double] = [1, 2, 3, 4, 5,5,2,1,2]
        let value = ["1", "2", "3", "4", "5","6", "7", "8", "9"]
        var dataEntries: [BarChartDataEntry] = []
        
        for (index, value) in mockData.enumerated() {
            let dataEntry = BarChartDataEntry(x: Double(index), y: value)
            dataEntries.append(dataEntry)
        }
        
        let dataSet = BarChartDataSet(entries: dataEntries, label: "Monthly Income")
        dataSet.colors = [NSUIColor.systemGreen] // Set bar colors
        
        let data = BarChartData(dataSet: dataSet)
        
        // Set the value formatter to display month names
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        barChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: value)
        barChartView.leftAxis.valueFormatter = YAxisValueFormatter() as! any AxisValueFormatter
        // Customize the appearance of the value labels
        //data.setValueFont(UIFont.systemFont(ofSize: 12))
        //data.setValueTextColor(NSUIColor.black)
        
        barChartView.data = data
    }
    
    
    //MARK: Inventory Overview
    func generateInventoryRandomData() -> [ChartDataEntry] {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<5 {
            let dataEntry = PieChartDataEntry(value: Double.random(in: 10...50))
            dataEntries.append(dataEntry)
        }
        
        return dataEntries
    }
    
    func updateInventoryChartWithData() {
        
        let dataEntries = generateInventoryRandomData()
        
        let dataSet = PieChartDataSet(entries: dataEntries, label: "")
        dataSet.colors = ChartColorTemplates.vordiplom()
        
        let data = PieChartData(dataSet: dataSet)
        // Customize pie chart appearance
        viewInventoryPicChart.holeRadiusPercent = 0.3
        viewInventoryPicChart.transparentCircleRadiusPercent = 0
        viewInventoryPicChart.drawEntryLabelsEnabled = false
        viewInventoryPicChart.data = data
        viewInventoryPicChart.usePercentValuesEnabled = true
        viewInventoryPicChart.drawSlicesUnderHoleEnabled = false
        viewInventoryPicChart.centerText = ""
        viewInventoryPicChart.legend.enabled = false
        viewInventoryPicChart.noDataText = ""
        viewInventoryPicChart.legend.enabled = true // Hide legend
        dataSet.drawValuesEnabled = showValues
        viewInventoryPicChart.center = viewInventoryPicChart.centerCircleBox
        viewInventoryPicChart.backgroundColor = UIColor.white
        viewInventoryPicChart.frame = CGRect(x: 0, y: 0, width: viewInventoryPicChart.frame.width, height: viewInventoryPicChart.frame.height)
        dataSet.colors = [NSUIColor.red, NSUIColor.green, NSUIColor.blue, NSUIColor.ios]
    }
    
    func fetchDesignations(completion: @escaping (Result<[Designation], APIError>) -> Void) {
        guard let url = URL(string: APIManager.UsersAuth.getDesignation) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.decodingError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let designations = try decoder.decode([Designation].self, from: data)
                completion(.success(designations))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
    
    func fetchDesignationData() {
        fetchDesignations { result in
            switch result {
            case .success(let fetchedDesignations):
                self.designations = fetchedDesignations
                DispatchQueue.main.async {
                    print(self.designations)
                }
            case .failure(let error):
                print("Error fetching designations: \(error)")
            }
        }
    }
    
    //    func getDesignation()  {
    //        var request = URLRequest(url: URL(string: APIManager.UsersAuth.getDesignation)!,timeoutInterval: Double.infinity)
    //        request.httpMethod = "GET"
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //            guard let data = data else {
    //                print(String(describing: error))
    //                return
    //            }
    //            //print(String(data: data, encoding: .utf8)!)
    //
    //            print(response)
    //        }
    //
    //        task.resume()
    //    }
    
    
    func getDesignation() {
        // Replace the placeholder URL with your actual API endpoint
        guard let url = URL(string: APIManager.UsersAuth.getDesignation) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            do {
                // Decode the JSON data
                let designationResponse = try JSONDecoder().decode(DesignationResponse.self, from: data)
                
                // Access the designation array
                let designationArray = designationResponse.data
                
                // Use the designationArray as needed
                print("Designations: \(designationArray)")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        // Start the data task
        task.resume()
    }
    
    //MARK: linechart
    func setupLineChart() {
        let entries = [
            ChartDataEntry(x: 1.0, y: 10.0),
            ChartDataEntry(x: 2.0, y: 15.0),
            ChartDataEntry(x: 3.0, y: 8.0),
            ChartDataEntry(x: 4.0, y: 12.0),
            ChartDataEntry(x: 5.0, y: 18.0),
            ChartDataEntry(x: 6.0, y: 10.0),
            ChartDataEntry(x: 7.0, y: 15.0),
            ChartDataEntry(x: 8.0, y: 8.0),
            ChartDataEntry(x: 9.0, y: 12.0),
            ChartDataEntry(x: 10.0, y: 18.0),
            ChartDataEntry(x: 11.0, y: 12.0),
            ChartDataEntry(x: 12.0, y: 13.0)
        ]
        
        let entries2 = [
            ChartDataEntry(x: 1.0, y: 10.0),
            ChartDataEntry(x: 2.0, y: 14.0),
            ChartDataEntry(x: 3.0, y: 8.0),
            ChartDataEntry(x: 4.0, y: 13.0),
            ChartDataEntry(x: 5.0, y: 17.0),
            ChartDataEntry(x: 6.0, y: 11.0),
            ChartDataEntry(x: 7.0, y: 14.0),
            ChartDataEntry(x: 8.0, y: 18.0),
            ChartDataEntry(x: 9.0, y: 16.0),
            ChartDataEntry(x: 10.0, y: 17.0),
            ChartDataEntry(x: 11.0, y: 12.0),
            ChartDataEntry(x: 12.0, y: 16.0)
        ]
        
        
        let dataSet2 = LineChartDataSet(entries: entries2, label: "Previous Month")
        let dataSet = LineChartDataSet(entries: entries, label: "This Month")
        dataSet.colors = [NSUIColor.purple]
        dataSet.circleColors = [NSUIColor.cyan]
        dataSet.circleRadius = 0
        dataSet2.circleRadius = 0
        
        dataSet.mode = .cubicBezier
        dataSet2.mode = .cubicBezier
        
        
        dataSet2.colors = [NSUIColor.red]
        dataSet2.circleColors = [NSUIColor.red]
        
        
        // Set data to the line chart view
        let data = LineChartData(dataSets: [dataSet, dataSet2])
        revenueLineChart.data = data
        
        // Customize chart appearance
        revenueLineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
        revenueLineChart.xAxis.labelPosition = .bottom
        revenueLineChart.xAxis.drawGridLinesEnabled = false
        revenueLineChart.xAxis.drawAxisLineEnabled = false
        revenueLineChart.rightAxis.enabled = false // Hide right axis
        revenueLineChart.legend.enabled = true // Hide legend
        revenueLineChart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .easeInOutBack)
    }
    
    
    func updateOccupancyChartWithData() {
        let dataEntries = generateInventoryRandomData()
        let dataSet = PieChartDataSet(entries: dataEntries, label: "")
        dataSet.colors = ChartColorTemplates.vordiplom()
        let data = PieChartData(dataSet: dataSet)
        // Customize pie chart appearance
        piechartOccupancy.holeRadiusPercent = 0.3
        piechartOccupancy.transparentCircleRadiusPercent = 0.1
        piechartOccupancy.drawEntryLabelsEnabled = false
        piechartOccupancy.data = data
        piechartOccupancy.usePercentValuesEnabled = false
        piechartOccupancy.drawSlicesUnderHoleEnabled = false
        piechartOccupancy.centerText = ""
        piechartOccupancy.legend.enabled = false
        piechartOccupancy.noDataText = ""
        piechartOccupancy.legend.enabled = true
        dataSet.drawValuesEnabled = showValues
        piechartOccupancy.backgroundColor = .white
        piechartOccupancy.absoluteAngles
        piechartOccupancy.animate(xAxisDuration: 1.5, easingOption: .easeInCirc)
        piechartOccupancy.maxAngle = 180.0
        piechartOccupancy.rotationAngle = 180.0
        dataSet.colors = [NSUIColor.red, NSUIColor.green, NSUIColor.blue, NSUIColor.ios]
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        viewInventoryPicChart.data = pieChartData
        viewInventoryPicChart.frame = CGRect(x: 0, y: 0, width: self.viewInventoryPicChart.frame.width, height: self.viewInventoryPicChart.frame.height)
        viewInventoryPicChart.center = viewInventoryPicChart.center
        var colors: [UIColor] = []
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        pieChartDataSet.drawValuesEnabled = showValues
        
        //            let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        //            let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        //            lineChartView.data = lineChartData
        
    }
    
    
    func updateChartWithData(jsonData: Any) {
        guard let jsonArray = jsonData as? [Double] else {
            print("Invalid JSON format")
            return
        }
        
        var dataEntries: [BarChartDataEntry] = []
        
        for (index, value) in jsonArray.enumerated() {
            let dataEntry = BarChartDataEntry(x: Double(index), y: value)
            dataEntries.append(dataEntry)
        }
        
        let dataSet = BarChartDataSet(entries: dataEntries, label: "Monthly Income")
        dataSet.colors = [NSUIColor.systemGreen] // Set bar colors
        
        let data = BarChartData(dataSet: dataSet)
        
        // Set the value formatter to display month names
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        // Customize the appearance of the value labels
        data.setValueFont(UIFont.systemFont(ofSize: 12))
        data.setValueTextColor(NSUIColor.black)
        
        barChartView.data = data
    }
    
    
    func setupPieChartData() {
        
        let entry1 = PieChartDataEntry(value: 30, label: "Label 1")
        let entry2 = PieChartDataEntry(value: 40, label: "Label 2")
        //        piechartOccupancy
        let entries: [PieChartDataEntry] = [
            entry1,entry2
            
        ]
        
        // Create a PieChartDataSet
        let dataSet = PieChartDataSet(entries: entries, label: "Occupancy")
        dataSet.drawValuesEnabled = showValues
        // Customize the appearance of the PieChartDataSet if needed
        dataSet.colors = ChartColorTemplates.joyful()
        
        // Create a PieChartData object with the PieChartDataSet
        let data = PieChartData(dataSet: dataSet)
        piechartOccupancy.data = data
        //piechartOccupancy.chartDescription.text = "Occupancy Chart"
        piechartOccupancy.centerText = "68"
        piechartOccupancy.holeRadiusPercent = 0.3
        piechartOccupancy.transparentCircleRadiusPercent = 0.2
        
        piechartOccupancy.animate(xAxisDuration: 1.5, easingOption: .easeInCirc)
        piechartOccupancy.maxAngle = 180.0
        piechartOccupancy.rotationAngle = 180.0
    }
    
    
    //MARK: monthly bar graph
    func setupBarChartView() {
        barChartView.noDataText = "No data available"
        barChartView.isUserInteractionEnabled = true
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.drawGridLinesEnabled = false
        
        let leftAxis = barChartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.axisMinimum = 0
        
        let rightAxis = barChartView.rightAxis
        rightAxis.enabled = false
        self.animateChartUpdate()
    }
    
    func updateChartData() {
        // Replace this with your actual data
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dev"]
        let income = [1000.0, 1500.0, 1200.0, 2000.0, 1800.0, 2500.0, 1200.0, 1100.0, 1340.0, 2005.0, 5600.0, 2500.0]
        
        setChartData(months: months, income: income)
    }
    
    func setChartData(months: [String], income: [Double]) {
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<months.count {
            let entry = BarChartDataEntry(x: Double(i), y: income[i])
            entries.append(entry)
        }
        
        let dataSet = BarChartDataSet(entries: entries, label: "Monthly Income")
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        if let dataSet = chartView.data?.dataSets[ highlight.dataSetIndex] {
            
            let sliceIndex: Int = dataSet.entryIndex( entry: entry)
            print( "Selected slice index: \( sliceIndex)")
        }
    }
    
    //MARK: Barchart
    func animateChartUpdate() {
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear( animated)
    //        let chart = PieChartView( frame: self.piechartOccupancy.frame)
    //    }
    
    
    @IBAction func btnSubMenuPressed(_ sender: UIButton) {
        viewSideMenu.isHidden = false
       
    }
    @IBAction func adrInfoBtn(_ sender: Any) {
    }
    
    @IBAction func revParInfoBtn(_ sender: Any) {
    }
    
    
    @IBAction func avgLeadTimeBtn(_ sender: Any) {
    }
    @IBAction func avgLosInfoBtn(_ sender: Any) {
    }
    
    @IBAction func notification(_ sender: Any) {
    }
    
    @IBAction func mtdBtn(_ sender: Any) {
    }
    @IBAction func calendar(_ sender: Any) {
        getDesignation()
    }
    @IBAction func ytdBtn(_ sender: Any) {
    }
    @IBAction func btnSideMenuBackPressed(_ sender: UIButton) {
        viewSideMenu.isHidden = true
    }
    @IBAction func btnDashBoardPressed(_ sender: UIButton) {
        viewDashboardBtn.backgroundColor = UIColor.black
        lblDashboard.textColor = UIColor.white
//        viewSideMenu.isHidden = true
    }
    @IBAction func btnRatesAndPlanePressed(_ sender: UIButton) {
    
    }
    @IBAction func btnCreateReaservationPressed(_ sender: UIButton) {
        viewCreateReservation.backgroundColor = UIColor.black
        lblCreateReservation.textColor = UIColor.white
        viewDashboardBtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        viewChannelAndMappingbtn.backgroundColor = UIColor.white
        viewBookingBtn.backgroundColor = UIColor.white
        
        lblCreateReservation.textColor = UIColor.black
        lblDashboard.textColor = UIColor.black
        lblChannelAndMaping.textColor = UIColor.black
        lblBooking.textColor = UIColor.black
        lblReportsAndLog.textColor = UIColor.black
        
    }
    @IBAction func btnViewChannelPressed(_ sender: UIButton) {
        viewChannelAndMappingbtn.backgroundColor = UIColor.black
        lblChannelAndMaping.textColor = UIColor.white
        viewDashboardBtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        viewBookingBtn.backgroundColor = UIColor.white
        
        lblCreateReservation.textColor = UIColor.black
        lblDashboard.textColor = UIColor.black
        lblChannelAndMaping.textColor = UIColor.black
        lblBooking.textColor = UIColor.black
        lblReportsAndLog.textColor = UIColor.black
    }
    @IBAction func btnBookingPressed(_ sender: UIButton) {
        viewBookingBtn.backgroundColor = UIColor.black
        lblBooking.textColor = UIColor.white
        viewDashboardBtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        viewChannelAndMappingbtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        
        lblCreateReservation.textColor = UIColor.black
        lblDashboard.textColor = UIColor.black
        lblChannelAndMaping.textColor = UIColor.black
        lblBooking.textColor = UIColor.black
        lblReportsAndLog.textColor = UIColor.black
    }
    @IBAction func btnViewReportsPressed(_ sender: UIButton) {
        viewReportsAndLogs.backgroundColor = UIColor.black
        lblReportsAndLog.textColor = UIColor.white
        viewDashboardBtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
        viewChannelAndMappingbtn.backgroundColor = UIColor.white
        viewCreateReservation.backgroundColor = UIColor.white
    
        
        lblCreateReservation.textColor = UIColor.black
        lblDashboard.textColor = UIColor.black
        lblChannelAndMaping.textColor = UIColor.black
        lblBooking.textColor = UIColor.black
        lblReportsAndLog.textColor = UIColor.black
    }
}
// MARK: - Extension Tableview
extension DashboradVC:UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        if indexPath.row == 0 {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardHeaderCell", for: indexPath) as! DashboardHeaderCell
        //            return cell
        //        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableCell", for: indexPath) as! DashboardTableCell
        //cell.setData(no: indexPath.row)
        return cell
    }
   
}

extension DashboradVC: PieChartDelegate {
    func onGenerateSlice(slice: PieCharts.PieSlice) {
        
    }
    
    func onStartAnimation(slice: PieCharts.PieSlice) {
        
    }
    
    func onEndAnimation(slice: PieCharts.PieSlice) {
        
    }
    
    func onSelected(slice: PieCharts.PieSlice, selected: Bool) {
        
    }
}

class YAxisValueFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(value) + " lakh"
    }
}

