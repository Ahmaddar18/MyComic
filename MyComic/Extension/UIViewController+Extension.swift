import UIKit

extension UIViewController {
    
    
    func setNavBar(title: String) {
        self.navigationController?.isNavigationBarHidden = false
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.isTranslucent = false
        navigationBar?.barTintColor = UIColor.white
        navigationBar?.tintColor = UIColor.purple
        navigationBar?.backgroundColor = UIColor.cyan

        // settingTitle
        self.navigationItem.title = title
    }
  
    
    @objc func openMenu(sender: UIButton) {
    }
    
    @objc func backPop(sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
