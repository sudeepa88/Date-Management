//
//  ShowViewController.swift
//  Test App
//
//  Created by Sudeepa Pal on 29/05/24.
//

import UIKit

class ShowViewController: UIViewController {
    
    var contactDetails : NewTask?
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        return textField
    }()
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Location"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select Date"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let textViewFirst: UITextView = {
        let textView =  UITextView()
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = false
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
    
    let startTimeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Start Time"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let endTimeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "End Time"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
//        let cancelButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(cancelButtonTapped))
//        cancelButton.tintColor = UIColor.red
//        
//        navigationItem.leftBarButtonItem = cancelButton
        
        view.addSubview(titleTextField)
        view.addSubview(locationTextField)
        view.addSubview(dateTextField)
        view.addSubview(textViewFirst)
        view.addSubview(textLabelView)
        
        
        view.addSubview(startTimeTextField)
        view.addSubview(endTimeTextField)
        
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
            view.endEditing(true)
       
        
        }
    
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
            
            
            textLabelView.topAnchor.constraint(equalTo: endTimeTextField.bottomAnchor, constant: 50),
            textLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            startTimeTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 10),
            startTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            startTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            startTimeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startTimeTextField.heightAnchor.constraint(equalToConstant: 40),
            
            endTimeTextField.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 10),
            endTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            endTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            endTimeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            endTimeTextField.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
//        let backNavigationController = ViewController()
//        navigationController?.pushViewController(backNavigationController, animated: true)
        }
}
