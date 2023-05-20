//
//  ProfileViewController.swift
//  FitnessApp
//
//

import UIKit

class ProfileViewController: UIViewController {
    
    var controller = Controller();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        
        self.controller.getCurLoginUser{ [self](user,i) -> Void in
            print(user)
            if(i==1){
                firstnameInput.text = user.name
                phoneInput.text = user.phone
                emailInput.text = user.email
                ageInput.text = user.age
                genderInput.text = user.gender
            }
        }
    }
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
    // MARK: Properties -
    let firstnameInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Name"
        input.title = "Name"
        input.text = ""
        input.disabledColor = .black
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let emailInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "E-mail"
        input.title = "E-mail"
        input.text = ""
        input.disabledColor = .black
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let genderInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Gender"
        input.title = "Gender"
        input.disabledColor = .black
        input.text = ""
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let phoneInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Phone number"
        input.title = "Phone number"
        input.text = ""
        input.disabledColor = .black
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let ageInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Age"
        input.title = "Age"
        input.text = ""
        input.disabledColor = .black
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    
    let inputStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    let logoutBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Log out", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 54/2
        btn.addTarget(self, action: #selector(ougOutClick), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func ougOutClick() {
        
        self.controller.signOut()
        let homeview = UINavigationController(rootViewController: LoginViewController())
        homeview.tabBarItem.image = UIImage(systemName: "house")
        homeview.title = "Home"
        
        let loginview = UINavigationController(rootViewController: LoginViewController())
        loginview.tabBarItem.image = UIImage(systemName: "person")
        loginview.title = "Profile"
        
        self.tabBarController?.selectedIndex = 0;
        self.tabBarController?.tabBar.tintColor = .label
        self.tabBarController?.viewControllers = [homeview,loginview];
    }
    
    func setupViews(){
        [inputStack,logoutBtn].forEach {
            view.addSubview($0)
        }
        [firstnameInput,emailInput,phoneInput,ageInput,genderInput].forEach {
            inputStack.addArrangedSubview($0)
        }
    }
    
    
    
    func setupConstraints(){
        
        
        NSLayoutConstraint.activate([
            
            inputStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            firstnameInput.heightAnchor.constraint(equalToConstant: 60),
            emailInput.heightAnchor.constraint(equalToConstant: 60),
            phoneInput.heightAnchor.constraint(equalToConstant: 60),
            ageInput.heightAnchor.constraint(equalToConstant: 60),
            genderInput.heightAnchor.constraint(equalToConstant: 60),
            
            logoutBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            logoutBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            logoutBtn.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }
    
}
