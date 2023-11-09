//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    //MARK: expenses array to populate TableView...
    var contacts = [Contact]()
    
    
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        //MARK: patching the table view delegate and datasource to controller...
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.dataSource = self
        
        //MARK: delete the seperate line of cell
        mainScreen.tableViewContacts.separatorStyle = .none
        
        //contacts.append(Contact(name: "dd", image: UIImage(systemName: "person.fill"), email: "dd@com..dfksjd", phoneType: "Cell", phoneNum: "111123213", address: "sdfsdf", cityAndState: "sdfsdfstate", zipCode: "19333"))
        //contacts.append(Contact(name: "Sky", image: UIImage(named: "sanji"), email: "jinsky@jk.com", phoneType: "Home", phoneNum: "4080092228", address: "sdfsdf", cityAndState: "sdfsdfstate", zipCode: "19333"))
                
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    //MARK: On add Bar Button tapped...
    @objc func onAddBarButtonTapped(){
        let createContactViewController = CreateContactViewController()
        createContactViewController.delegate = self
        navigationController?.pushViewController(createContactViewController, animated: true)
    }
    
    //MARK: got the new contact back and delegated to ViewController...
    func delegateOnCreateContact(index: Int?, contact: Contact){
        if let unwrappedIndex = index {
            contacts[unwrappedIndex] = contact
        } else {
            contacts.append(contact)
        }
        mainScreen.tableViewContacts.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        
        guard let uwName = contacts[indexPath.row].name,
              let uwEmail = contacts[indexPath.row].email,
              let uwPhoneNum = contacts[indexPath.row].phoneNum,
              let uwPhoneType = contacts[indexPath.row].phoneType,
              let uwImage = contacts[indexPath.row].image
        else {
            return cell
        }
        
        cell.labelName.text = "\(uwName)"
        cell.labelEmail.text = "\(uwEmail)"
        cell.labelPhone.text = "\(uwPhoneNum) (\(uwPhoneType))"
        cell.imageContact.image = uwImage
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.delegate = self
         contactDetailViewController.indexOfRow = indexPath.row
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
    
    
}

