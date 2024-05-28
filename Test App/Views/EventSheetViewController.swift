//
//  EventSheetViewController.swift
//  Test App
//
//  Created by Sudeepa Pal on 27/05/24.
//

import UIKit
import RealmSwift

class EventSheetViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Location"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select Date"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let dateView = UIDatePicker()
        dateView.datePickerMode = .date
        dateView.preferredDatePickerStyle = .inline
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return dateView
    }()
    
    let textViewFirst: UITextView = {
        let textView =  UITextView()
        textView.isScrollEnabled = true
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.cornerRadius = 10.0
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let textLabelView: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Notes"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255,alpha: 1)
        self.title = "New Event"
        let cancelButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = UIColor.red
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = UIColor.red
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = addButton
        
        titleTextField.delegate = self
        locationTextField.delegate = self
        dateTextField.delegate = self
        textViewFirst.delegate = self
        //textLabelView.delegate = self
        
        
        view.addSubview(titleTextField)
        view.addSubview(locationTextField)
        view.addSubview(dateTextField)
        view.addSubview(textViewFirst)
        view.addSubview(textLabelView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // view.addSubview(datePicker)
        dateTextField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, doneButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
        
        setupUI()
    }
    
    // MARK: - Navigation
    
    func setupUI() {
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 0),
            locationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            dateTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 30),
            dateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            textViewFirst.topAnchor.constraint(equalTo: textLabelView.bottomAnchor, constant: 10),
            textViewFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textViewFirst.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            
            textLabelView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 100),
            textLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        ])
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        // Handle date changes if needed
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy" // Change the date format as needed
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    @objc func doneButtonTapped() {
        dateTextField.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
            self.dismiss(animated: true, completion: nil)
        }
    
    @objc func addButtonTapped() {
        var printingIT = textViewFirst.text
        
        if titleTextField.text?.isEmpty ?? true {
            displayWarning(message: "Please enter title")
            return
        }
        
        if locationTextField.text?.isEmpty ?? true {
            displayWarning(message: "Please enter Location Details")
            return
        }
        
        if dateTextField.text?.isEmpty ?? true {
            displayWarning(message: "Please Select Date")
            return
        }
        
        if textViewFirst.text?.isEmpty ?? true {
            displayWarning(message: "Please Enter Some notes")
            return
        }
        
        
        
        //CRUD: Create
        let taskList = TaskFile()
        taskList.title = titleTextField.text!
        taskList.location = locationTextField.text!
        taskList.selectedDate = dateTextField.text!
        taskList.textFieldView = textViewFirst.text!
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(taskList)
            }
        } catch {
            print("Error Inilization new realm, \(error)")
        }
        
        completionHandler?()
        
        print(printingIT!)
        dismiss(animated: true, completion: nil)
        }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    private func displayWarning(message: String){
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.view.tintColor = .red
        present(alert, animated: true, completion: nil)
    }
}
