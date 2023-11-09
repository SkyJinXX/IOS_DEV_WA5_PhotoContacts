//
//  CreateContactViewController.swift

import UIKit
import PhotosUI

class CreateContactViewController: UIViewController {
    var delegate:ViewController!
    var indexOfRow: Int?
    
    //MARK: initializing the Create Contact View...
    let createProfileView = CreateContactView()
    
    var selectedPhoneType = "Home"
    
    //MARK: variable to store the picked Image...
    var pickedImage:UIImage? = UIImage(systemName: "person.fill")
    
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = createProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: set title to make the back button in show Profile screen shows "Create Contact"
        if indexOfRow != nil {
            self.title = "Edit"
        } else {
            self.title = "Create Contact"
        }
        
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onButtonSaveTapped)
        )
        
        //MARK: adding menu to buttonSelectType...
        createProfileView.buttonSelectPhoneType.menu = getMenuTypes()
        //MARK: adding menu to buttonTakePhoto...
        createProfileView.buttonTakePhoto.menu = getMenuImagePicker()
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        //MARK: move the view up, when keyboard shows
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: menu for buttonSelectType setup...
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.phoneTypes{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedPhoneType = type
                                self.createProfileView.buttonSelectPhoneType.setTitle(self.selectedPhoneType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    //MARK: delegate method for Detail
    func delegateOnContactDetail(index: Int, delegate: ViewController){
        indexOfRow = index
        self.delegate = delegate
        let contact = delegate.contacts[index]
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
        self.createProfileView.buttonTakePhoto.setImage(
            unwrappedImage.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        self.pickedImage = unwrappedImage
        self.createProfileView.textFieldName.text = unwrappedName
        self.createProfileView.textFieldEmail.text = unwrappedEmail
        self.createProfileView.textFieldPhoneNum.text = unwrappedPhoneNum
        self.selectedPhoneType = unwrappedPhoneType
        self.createProfileView.buttonSelectPhoneType.setTitle(unwrappedPhoneType, for: .normal)
        self.createProfileView.textFieldAddress.text = unwrappedAddress
        self.createProfileView.textFieldCityAndState.text = unwrappedCityAndState
        self.createProfileView.textFieldZipCode.text = unwrappedZipCode
        
        
    }
    
    //MARK: Hide Keyboard, when tap outside the keyboard
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    // MARK: keyboard Show and Hide event
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height / 6
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    
    //MARK: submit button tapped action...
    @objc func onButtonSaveTapped(){
        // get Name
        guard let unwrappedName = createProfileView.textFieldName.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedName.isEmpty else {
            showErrorAlert(message: "Name can't be empty!")
            return
        }
        // get Email
        guard let unwrappedEmail = createProfileView.textFieldEmail.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedEmail.isEmpty else {
            return showErrorAlert(message: "Email can't be empty!")
        }
        guard isValidEmail(unwrappedEmail) else {
            return showErrorAlert(message: "Invalid Email!")
        }
        // get PhoneNum
        guard let unwrappedPhoneNum = createProfileView.textFieldPhoneNum.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPhoneNum.isEmpty else {
            showErrorAlert(message: "Phone Number can't be empty!")
            return
        }
        guard isValidPhoneNum(unwrappedPhoneNum) else {
            return showErrorAlert(message: "Invalid Phone Number!")
        }
        // get Address
        guard let unwrappedAddress = createProfileView.textFieldAddress.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedAddress.isEmpty else {
            showErrorAlert(message: "Address can't be empty!")
            return
        }
        // get CityAndState
        guard let unwrappedCityAndState = createProfileView.textFieldCityAndState.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedCityAndState.isEmpty else {
            showErrorAlert(message: "City and State can't be empty!")
            return
        }
        // get ZipCode
        guard let unwrappedZipCode = createProfileView.textFieldZipCode.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedZipCode.isEmpty else {
            showErrorAlert(message: "ZIP Code can't be empty!")
            return
        }
        guard isValidZipCode(unwrappedZipCode) else {
            return showErrorAlert(message: "Invalid ZIP Code!")
        }
        
        let contact = Contact(name: unwrappedName, image: pickedImage ?? (UIImage(systemName: "photo"))!, email: unwrappedEmail, phoneType: selectedPhoneType, phoneNum: unwrappedPhoneNum, address: unwrappedAddress, cityAndState: unwrappedCityAndState, zipCode: unwrappedZipCode)
        
        delegate.delegateOnCreateContact(index: indexOfRow, contact: contact)
        navigationController?.popViewController(animated: true)
        
    }
    //MARK: Alert controller logics
    func showErrorAlert(message: String? = "Input Error"){
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    // MARK: Text field check logics
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidZipCode(_ zipCode: String) -> Bool {
        if zipCode.count != 5 {
            return false
        }
        
        if let zipInt = Int(zipCode), zipInt >= 1, zipInt <= 99950 {
            return true
        }
        
        return false
    }
    func isValidPhoneNum(_ phoneNum: String) -> Bool {
        let phoneRegEx = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: phoneNum)
    }
    
}



//MARK: adopting required protocols for PHPicker...
extension CreateContactViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.createProfileView.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension CreateContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.createProfileView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
