//
//  ViewController.swift
//  FitnessApp
//
//

import UIKit

class ViewController: UITabBarController,UITabBarControllerDelegate {

    var isLoginChecked = false;
    var user : UserModel?
    
    var controller = Controller();
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.delegate = self
        self.controller.getCurLoginUser{ [self](user,i) -> Void in
            self.user = user;
            if(i==1){
                self.createView(isLogin:true)
            }else{
                self.createView(isLogin:false)
            }
        }
    }
    
    func createView(isLogin:Bool){
        
   
        if(isLogin){
            
            let main = HomeViewController();
//            main.user = user;
            let homeview = UINavigationController(rootViewController: main)
            homeview.tabBarItem.image = UIImage(systemName: "house")
            homeview.title = "Home"
            
            let loginview = UINavigationController(rootViewController: BMIViewController())
            loginview.tabBarItem.image = UIImage(systemName: "person")
            loginview.title = "BMI"
            
            let favView = UINavigationController(rootViewController: ScheduleViewController())
            favView.tabBarItem.image = UIImage(systemName: "star")
            favView.title = "SCHEDULE"
            
            let profileView = UINavigationController(rootViewController: ProfileViewController())
            profileView.tabBarItem.image = UIImage(systemName: "person")
            profileView.title = "PROFILE"
            
            tabBar.tintColor = .label
            
            setViewControllers([homeview,loginview,favView,profileView], animated: true)
        }else{
            
            let bmiView = UINavigationController(rootViewController: BMIViewController())
            bmiView.tabBarItem.image = UIImage(systemName: "person")
            bmiView.title = "BMI"
            
            let loginview = UINavigationController(rootViewController: LoginViewController())
            loginview.tabBarItem.image = UIImage(systemName: "person")
            loginview.title = "LOGIN"

            
            tabBar.tintColor = .label
            
            setViewControllers([loginview,bmiView], animated: true)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        
        let tapIndex = viewControllers.firstIndex(of: viewController)!
        handleTabSelection(selectedIndex:tapIndex);
    }
    
   
    private func handleTabSelection(selectedIndex:Int){
        if(!isLoginChecked){
            isLoginChecked = true
            self.controller.getCurLoginUser{(user,i) -> Void in
                print(user)
                if(i==1){
                    self.createView(isLogin:true)
                }else{
                    self.createView(isLogin:false)
                }
            }
        }
        print(selectedIndex);
    }

}

