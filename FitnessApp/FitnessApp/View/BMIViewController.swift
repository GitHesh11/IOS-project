//
//  BMIViewController.swift
//  FitnessApp
//
//

import UIKit


class BMIViewController: UIViewController {
    
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calculate Your BMI"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let greetingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please Fill Data"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    let holder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    
    let ageField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Age"
        textField.backgroundColor = .systemGray6
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let massField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Weight (KG)"
        textField.backgroundColor = .systemGray6
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let heigtField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Height (CM)"
        textField.backgroundColor = .systemGray6
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        return textField
    }()
    
  
    let recoveryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 15)
        label.textColor = .red
        label.textAlignment = .right
        return label
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        return button
    }()
    
   
    
    let textFieldHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    
    let registerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()

    
    let bottomHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 45
        holder.alignment = .center
        return holder
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color.light_green
        
        holder.insertArrangedSubview(firstLabel, at: 0)
        holder.insertArrangedSubview(greetingLabel, at: 1)
        
        textFieldHolder.insertArrangedSubview(ageField, at: 0)
        textFieldHolder.insertArrangedSubview(massField, at: 1)
        textFieldHolder.insertArrangedSubview(heigtField, at: 2)
        textFieldHolder.insertArrangedSubview(recoveryLabel, at: 3)
        textFieldHolder.insertArrangedSubview(signInButton, at: 4)
        
        
        bottomHolder.insertArrangedSubview(registerLabel, at: 0)
        
        view.addSubview(holder)
        view.addSubview(textFieldHolder)
        view.addSubview(bottomHolder)
        setupConstraints()
    }
    
    func setupConstraints() {
        holder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        holder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        holder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        
        textFieldHolder.topAnchor.constraint(equalTo: holder.bottomAnchor, constant: 40).isActive = true
        textFieldHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        ageField.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        ageField.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        ageField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        massField.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        massField.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        massField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        heigtField.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        heigtField.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        heigtField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        recoveryLabel.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        recoveryLabel.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        
        
        signInButton.topAnchor.constraint(equalTo: recoveryLabel.bottomAnchor, constant: 90).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bottomHolder.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 40).isActive = true
        bottomHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        bottomHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
    }
    
    var controller = Controller();
    
    @objc func calculate() {
       
                var mass :Double? = Double(massField.text!) //KG
                let height :Double? = Double(heigtField.text!)//CM
                let h = height!  * height!;
                let bmi = mass ?? 0 / ( h / 10000)
        
                    switch bmi {
                    case 0..<18.5:
                        registerLabel.text = "Your bmi is \(bmi) therefore you are underweight"
                    case 18.5..<25:
                        registerLabel.text = "Your bmi is \(bmi) therefore you are of normal weight"
                    case 25...:
                        registerLabel.text = "Your bmi is \(bmi) therefore you are overweight"
                    default:
                        registerLabel.text = ""
                    }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showAlert(title:String){
        let alertView = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
}
