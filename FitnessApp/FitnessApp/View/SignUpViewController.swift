//
//  SignUpViewController.swift
//  FitnessApp
//
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var controller = Controller();
    var validation = Validation();
    var gender = "Male";

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
        setupConstraints()
        [firstnameInput,passwordInput,emailInput,phoneInput,ageInput].forEach {
            $0.delegate = self
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    // hide tabBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "Register"
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name:font.semi_bold.rawValue, size: 16.0)!,NSAttributedString.Key.foregroundColor: color.black]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = .black
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.backBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        let leftButton = UIBarButtonItem()
        leftButton.customView = backButton
        navigationItem.setLeftBarButton(leftButton, animated: true)
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
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let passwordInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Password"
        input.title = "Password"
        input.text = "Boateng"
        input.isSecureTextEntry.toggle()
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let emailInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "E-mail"
        input.title = "E-mail"
        input.text = "kwameagyenimboateng64@gmail.com"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let phoneInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Phone number"
        input.title = "Phone number"
        input.text = "+233208956935"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let ageInput : UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Age"
        input.title = "Age"
        input.text = ""
        input.keyboardType = .numberPad
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let maleBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Male", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(male), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let femaleBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Female", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = .systemGray
        btn.addTarget(self, action: #selector(female), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let inputStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let signUpBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 54/2
        btn.addTarget(self, action: #selector(registerClick), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func male(){
        gender = "Male";
        maleBtn.backgroundColor = .black
        femaleBtn.backgroundColor = .systemGray
    }
    @objc func female(){
        gender = "Female";
        maleBtn.backgroundColor = .systemGray
        femaleBtn.backgroundColor = .black
    }
    
    @objc func registerClick(){
        if(self.emailInput.text!.isEmpty){
            showAlert(title: "Please Enter Email")
            return;
        }

        if(!self.validation.validateEmail(self.emailInput.text!)){
            showAlert(title: "Invalid Email")
            return;

        }
        if(self.passwordInput.text!.isEmpty){
            showAlert(title: "Please Enter Password")
            return;
        }
        if(!self.validation.validatePassword(self.passwordInput.text!)){
            showAlert(title: "Password at least 6 characters")
            return;
        }

        self.controller.registerUser(email: self.emailInput.text!, password: self.passwordInput.text!, name: self.firstnameInput.text!, phone: self.phoneInput.text!,age:self.ageInput.text!,gender:gender) {(success) in
            if(success){
                self.showAlert(title: "Success")
            }else{
                self.showAlert(title: "Failed")
            }
        }
    }
    
    @objc func hideKeyboard(){
        [firstnameInput,passwordInput,emailInput,ageInput].forEach { item in
            item.resignFirstResponder()
            item.removeBorders()
        }
    }
    func setupViews(){
        [inputStack,signUpBtn].forEach {
            view.addSubview($0)
        }
        [firstnameInput,passwordInput,emailInput,phoneInput,ageInput,maleBtn,femaleBtn].forEach {
            inputStack.addArrangedSubview($0)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if firstnameInput.isFirstResponder{
            firstnameInput.addBorders()
            [emailInput,passwordInput].forEach {
                $0.removeBorders()
            }
        }
        else if passwordInput.isFirstResponder {
            passwordInput.addBorders()
            [firstnameInput,emailInput].forEach {
                $0.removeBorders()
            }
        }
        else if emailInput.isFirstResponder{
            emailInput.addBorders()
            [firstnameInput,passwordInput].forEach {
                $0.removeBorders()
            }
        }
        else if phoneInput.isFirstResponder{
            phoneInput.addBorders()
            [emailInput,passwordInput].forEach {
                $0.removeBorders()
            }
        }
        else if ageInput.isFirstResponder{
            ageInput.addBorders()
            [passwordInput,phoneInput].forEach {
                $0.removeBorders()
            }
        }
    }
    func removeResponder(input: UITextField){
        if firstnameInput.isFirstResponder{
            removeResponder(input: firstnameInput)
            input.resignFirstResponder()
        }
        else if passwordInput.isFirstResponder{
            removeResponder(input: passwordInput)
            input.resignFirstResponder()
        }
        else if emailInput.isFirstResponder{
            removeResponder(input: emailInput)
            input.resignFirstResponder()
        }
        else if phoneInput.isFirstResponder{
            removeResponder(input: phoneInput)
            input.resignFirstResponder()
        }
        else if ageInput.isFirstResponder{
            removeResponder(input: ageInput)
            input.resignFirstResponder()
        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            inputStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            firstnameInput.heightAnchor.constraint(equalToConstant: 60),
            passwordInput.heightAnchor.constraint(equalToConstant: 60),
            emailInput.heightAnchor.constraint(equalToConstant: 60),
            phoneInput.heightAnchor.constraint(equalToConstant: 60),
            ageInput.heightAnchor.constraint(equalToConstant: 60),
            maleBtn.heightAnchor.constraint(equalToConstant: 20),
            femaleBtn.heightAnchor.constraint(equalToConstant: 20),
            
            signUpBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signUpBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpBtn.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
 
    func showAlert(title:String){
        let alertView = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){_ in
            if(title=="Success"){
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
}
