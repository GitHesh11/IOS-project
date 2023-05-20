//
//  ExerciseViewController.swift
//  FitnessApp
//
//

import Foundation
import UIKit
import Kingfisher

class ExerciseViewController: UIViewController {
    
    var user : UserModel?
    var exe: ExerciseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        view.addSubview(textFieldHolder)
        view.addSubview(greetingHolder)
        
        greetingHolder.heightAnchor.constraint(equalToConstant: 300).isActive = true
        greetingHolder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        greetingHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        greetingHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true

        textFieldHolder.topAnchor.constraint(equalTo: greetingHolder.bottomAnchor, constant: 10).isActive = true
        textFieldHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        greetingHolder.addArrangedSubview(foodImage);
        foodImage.contentMode = .scaleAspectFit
        foodImage.clipsToBounds=true
        

        
        textFieldHolder.insertArrangedSubview(foodName, at: 0)
        textFieldHolder.insertArrangedSubview(foodCal, at: 1)
        textFieldHolder.insertArrangedSubview(foodDesc, at: 2)
        
        navigationController?.navigationBar.isHidden = false
        
        
        
        foodName.text = exe?.name;
        
        foodDesc.text = exe?.description;
        
        
        foodImage.kf.setImage(with: URL(string: exe?.img ?? ""))
        
    }
    let foodName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let foodDesc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let foodCal : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let textFieldHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    let greetingHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    
    let favHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .horizontal
        holder.spacing = 5
        return holder
        
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    // MARK: Properties -
    
    let foodImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
   
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "About"
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
    
    
    let controller = Controller();
    
    func showAlert(title:String){
        let alertView = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }

}
