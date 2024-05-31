////
////  DetailViewController.swift
////  Test App
////
////  Created by Sudeepa Pal on 29/05/24.
////
//
//import UIKit
//import RealmSwift
//
//class DetailViewController: UIViewController {
//
//    var selectedDate: String?
//    
//    private var reminder = [TaskFile]()
//    let realm = try! Realm()
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//           view.backgroundColor = .white
//           // Very Very Important
//           reminder = realm.objects(TaskFile.self).map({$0})
//          // print("Let's Check This,", reminder[3].selectedDate)
//           
//           if let date = selectedDate {
//               let dateLabel = UILabel()
//               dateLabel.text = "Selected date: \(date)"
//              // dateLabel.text = "Selected date: \(reminder[3].selectedDate)"
//               dateLabel.translatesAutoresizingMaskIntoConstraints = false
//               view.addSubview(dateLabel)
//
//               NSLayoutConstraint.activate([
//                   dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                   dateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//               ])
//           }
//       }
//
//}



