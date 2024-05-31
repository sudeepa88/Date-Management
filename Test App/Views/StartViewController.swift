////
////  StartViewController.swift
////  Test App
////
////  Created by Sudeepa Pal on 27/05/24.
////
//
//import UIKit
//import RealmSwift
//
//class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//
//    private var reminder = [TaskFile]()
//    let realm = try! Realm()
//    
//    let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        let plusButton =  UIBarButtonItem(image: UIImage(systemName: "plus"),
//                                         style: .plain, target: self, action: #selector(presentingNextSlide))
//        plusButton.tintColor = UIColor(.red)
//        
//        navigationItem.rightBarButtonItem = plusButton
//        
//        reminder = realm.objects(TaskFile.self).map({$0})
//        
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        tableView.register(DateViewTVC.self, forCellReuseIdentifier: "cell")
//        tableView.separatorStyle = .none
//        view.addSubview(tableView)
//       // print("At this point , ", reminder[3].selectedDate)
//        setupTableView()
//        
////        try! realm.write {
////            // Delete all instances of Dog from the realm.
////            let allDogs = realm.objects(TaskFile.self)
////            realm.delete(allDogs)
////        }
//
//        
//    }
//    // MARK: - Navigation
//
//    @objc func presentingNextSlide() {
//        print("Printing It")
//        let usersEventMain = EventSheetViewController()
//        let usersEvent = UINavigationController(rootViewController: usersEventMain)
////        usersEventMain.completionHandler = {
////            [weak self] in
////            self?.refresh()
////        }
//        self.present(usersEvent, animated: true, completion: nil)
//        
//        
//        
//        tableView.reloadData()
//    }
//    func refresh(){
//        reminder = realm.objects(TaskFile.self).map({$0})
//        tableView.reloadData()
//    }
//    
//    func setupTableView() {
//        NSLayoutConstraint.activate([
//            
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        
//        ])
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reminder.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DateViewTVC
//        
//        //cell.textLabel?.text = people[indexPath.row].accountName
//        cell.titleLabel.text = reminder[indexPath.row].title
//
//        cell.dateLabel.text = reminder[indexPath.row].selectedDate
//        
//       // cell.containerView.layer.cornerRadius = 30
//       // tableView.reloadData()
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let showDetails = ShowViewController()
//        let detailsView = UINavigationController(rootViewController: showDetails)
//        
//        let item = reminder[indexPath.row]
//        showDetails.contactDetails = item
//        showDetails.titleTextField.text = reminder[indexPath.row].title
//        showDetails.locationTextField.text = reminder[indexPath.row].location
//        showDetails.dateTextField.text = reminder[indexPath.row].selectedDate
//        showDetails.textViewFirst.text = reminder[indexPath.row].textFieldView
//        
//        print("Here is our selected index Path", indexPath.row)
//        self.present(detailsView, animated: true, completion: nil)
//        
//    }
//
//}
