//
//  ContactDetailViewController.swift

import UIKit

class ContactDetailViewController: UIViewController {
    
    //MARK: creating instance of ShowProfileView...
    let contactDetailView = ContactDetailView()
    
    var indexOfRow: Int?
    var delegate: ViewController!
    
    //MARK: patch the view of the controller to the ShowProfileView...
    override func loadView() {
        view = contactDetailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit, target: self,
            action: #selector(onButtonEditTapped)
        )
        
        let contact = delegate.contacts[indexOfRow!]
        
        //MARK: setting the Labels' texts...
        // unwrap package
        guard let unwrappedImage = contact.image,
            let unwrappedName = contact.name,
              let unwrappedEmail = contact.email,
              let unwrappedPhoneType = contact.phoneType,
              let unwrappedPhoneNum = contact.phoneNum,
              let unwrappedAddress = contact.address,
              let unwrappedCityAndState = contact.cityAndState,
              let unwrappedZipCode = contact.zipCode else {
            return
        }
        // make sure is not empty
        guard !unwrappedName.isEmpty,
              !unwrappedEmail.isEmpty,
              !unwrappedPhoneType.isEmpty,
              !unwrappedPhoneNum.isEmpty,
              !unwrappedAddress.isEmpty,
              !unwrappedCityAndState.isEmpty,
              !unwrappedZipCode.isEmpty else {
            return
        }
        // set content
        contactDetailView.imageContact.image = unwrappedImage
        contactDetailView.labelName.text = "\(unwrappedName)"
        contactDetailView.labelEmail.text = "Email: \(unwrappedEmail)"
        contactDetailView.labelPhone.text = "Phone: \(unwrappedPhoneNum) (\(unwrappedPhoneType))"
        contactDetailView.labelAddress.text = "\(unwrappedAddress)"
        contactDetailView.labelCityAndState.text = "\(unwrappedCityAndState)"
        contactDetailView.labelZipCode.text = "\(unwrappedZipCode)"
        //contactDetailView.imagePhoneType.image = UIImage(named: unwrappedPhoneType.lowercased())
        
        
    }
    
    @objc func onButtonEditTapped() {
        let createContactViewController = CreateContactViewController()
        createContactViewController.delegateOnContactDetail(index: indexOfRow!, delegate: delegate)
        
        var viewControllers = navigationController?.viewControllers
        viewControllers?.removeLast()  // remove the current view controller
        viewControllers?.append(createContactViewController)  // add the new view controller
        
        navigationController?.setViewControllers(viewControllers!, animated: true)
    }

    
}
