//
//  CreateProfileView.swift

import UIKit

class CreateContactView: UIView {
    
    var textFieldName: UITextField!
    var buttonTakePhoto: UIButton!
    var labelPhoto: UILabel!
    var textFieldEmail: UITextField!
    var labelAddPhone: UILabel!
    var buttonSelectPhoneType: UIButton!
    var textFieldPhoneNum: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityAndState: UITextField!
    var textFieldZipCode: UITextField!
    var buttonSubmit: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints
        setupTextFieldName()
        setupbuttonTakePhoto()
        setupLabelPhoto()
        setupTextFieldEmail()
        setupButtonSelectPhoneType()
        setupTextFieldPhoneNum()
        setupTextFieldAddress()
        setupTextFieldCityAndState()
        setupTextFieldZipCode()
        
        initConstraints()
    }
    
    //MARK: initializing the UI elements
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.layer.cornerRadius = 10
        buttonTakePhoto.clipsToBounds = true
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    func setupLabelPhoto() {
        labelPhoto = UILabel()
        labelPhoto.text = "Photo"
        labelPhoto.textAlignment = .left
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        labelPhoto.textColor = .lightGray
        self.addSubview(labelPhoto)
    }


    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    func setupButtonSelectPhoneType(){
        buttonSelectPhoneType = UIButton(type: .system)
        buttonSelectPhoneType.setTitle("Home", for: .normal)
        buttonSelectPhoneType.showsMenuAsPrimaryAction = true
        buttonSelectPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectPhoneType)
    }
    func setupTextFieldPhoneNum(){
        textFieldPhoneNum = UITextField()
        textFieldPhoneNum.placeholder = "PhoneNum"
        textFieldPhoneNum.borderStyle = .roundedRect
        textFieldPhoneNum.keyboardType = .phonePad
        textFieldPhoneNum.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNum)
    }
    
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    
    func setupTextFieldCityAndState(){
        textFieldCityAndState = UITextField()
        textFieldCityAndState.placeholder = "City, State"
        textFieldCityAndState.borderStyle = .roundedRect
        textFieldCityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityAndState)
    }
    
    func setupTextFieldZipCode(){
        textFieldZipCode = UITextField()
        textFieldZipCode.placeholder = "Zip Code"
        textFieldZipCode.borderStyle = .roundedRect
        textFieldZipCode.keyboardType = .numberPad
        textFieldZipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZipCode)
    }
    
    
    //MARK: initializing constraints...
    func initConstraints(){
        textFieldPhoneNum.setContentHuggingPriority(.defaultLow, for: .horizontal)
        buttonSelectPhoneType.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            textFieldName.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant:-32),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: setting buttonTakePhoto's height and width..
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 0),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            textFieldEmail.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant:-32),
            
            
            buttonSelectPhoneType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            buttonSelectPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonSelectPhoneType.leadingAnchor.constraint(equalTo: textFieldPhoneNum.trailingAnchor, constant: 8),
            buttonSelectPhoneType.widthAnchor.constraint(equalToConstant: 48),
                        
            textFieldPhoneNum.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            //textFieldPhoneNum.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhoneNum.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            //textFieldPhoneNum.trailingAnchor.constraint(equalTo: buttonSelectPhoneType.leadingAnchor, constant:-16),
            
            
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNum.bottomAnchor, constant: 16),
            textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAddress.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            textFieldAddress.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant:-32),
            
            textFieldCityAndState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCityAndState.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            textFieldCityAndState.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant:-32),
            
            textFieldZipCode.topAnchor.constraint(equalTo: textFieldCityAndState.bottomAnchor, constant: 16),
            textFieldZipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldZipCode.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:32),
            textFieldZipCode.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant:-32),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
