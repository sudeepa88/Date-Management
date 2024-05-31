//
//  ViewController.swift
//  Test App
//
//  Created by Sudeepa Pal on 27/05/24.
//

import UIKit
import FSCalendar
import RealmSwift

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate weak var calendar: FSCalendar!
    
    private var reminder = [NewTask]()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let plusButton =  UIBarButtonItem(image: UIImage(systemName: "plus"),
                                         style: .plain, target: self, action: #selector(presentingNextSlide))
        plusButton.tintColor = UIColor(.red)
        
        navigationItem.rightBarButtonItem = plusButton
        
        reminder = realm.objects(NewTask.self).map({$0})
        
        // Do any additional setup after loading the view.
        let calendar = FSCalendar(frame: CGRect(x: 10, y: 100, width: 370, height: 680))
        //calendar.allowsMultipleSelection = true;
        calendar.appearance.eventDefaultColor = .green
        calendar.appearance.weekdayTextColor = .red
        calendar.appearance.headerTitleColor = UIColor.red
        calendar.scrollDirection = .vertical
        calendar.dataSource = self
        calendar.delegate = self
    
        view.addSubview(calendar)
        self.calendar = calendar
        
    }

    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            // Return 1 if the date should show an event dot, otherwise 0
        
            return shouldShowEventDot(for: date) ? 1 : 0
        }
    
    func shouldShowEventDot(for date: Date) -> Bool {
            // Add your logic to determine if the date should have an event dot
           // return true  // Example logic, change this according to your needs
        //print("From Showing Dots--> ", reminder[3].selectedDate)
        
       // print("Printing from FSCalender:->",reminder.count)
        
        let calendar = Calendar.current
                let components = calendar.dateComponents([.year, .month, .day], from: date)

                // Check if the date is June 10th or June 16th
//        if components.month == 6 && (components.day == 10 || components.day == 16) {
//            return true
//        }
                
        
        var g = ""
        
        for value in 0..<reminder.count {
            g = reminder[value].selectedDate
            //print("Here is Every date g ", g)
            
            var components2 = g.split(separator: "/")
            //print("Here is my components --> ", components2)
            var day = Int(components2[0])
            var month = Int(components2[1])
            var year = Int(components2[2])
       
            
            if components.month == month! && components.day == day! {
                return true
            }
        }
            

                return false
        
        }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            // Create and present a new view controller when a date is selected
           // let detailViewController = DetailViewController()
        let detailViewController = ShowViewController()
        // Create a date formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" // Specify your desired date format
            dateFormatter.timeZone = TimeZone.current // Set the time zone to the current time zone
            
            // Convert the date to a string
            let dateString = dateFormatter.string(from: date)
            
            // Print the formatted date string
            //print("Here is the Date --> ", dateString)
           // detailViewController.selectedDate = dateString
        for i in 0..<reminder.count {
            if dateString == reminder[i].selectedDate {
                detailViewController.dateTextField.text = reminder[i].selectedDate
                detailViewController.titleTextField.text = reminder[i].title
                detailViewController.locationTextField.text = reminder[i].location
                detailViewController.textViewFirst.text = reminder[i].textFieldView
                detailViewController.startTimeTextField.text = reminder[i].startTime
                detailViewController.endTimeTextField.text = reminder[i].endTime
            }
        }
        
        
           navigationController?.pushViewController(detailViewController, animated: true)
        }
    
    @objc func presentingNextSlide() {
       // print("Pl")
        let usersEventMain = EventSheetViewController()
        let usersEvent = UINavigationController(rootViewController: usersEventMain)

        
        usersEventMain.completionHandler = { [weak self] in
                    self?.reminder = self?.realm.objects(NewTask.self).map({ $0 }) ?? []
                    self?.calendar.reloadData()
                }
        
        self.present(usersEvent, animated: true, completion: nil)
    }
}

