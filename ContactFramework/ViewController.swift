//
//  ViewController.swift
//  ContactFramework
//
//  Created by Dhaval Gevariya on 10/06/20.
//  Copyright © 2020 Dhaval Gevariya. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {
    
    
    var contacts = [CNContact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // `contacts` Contains all details of Phone Contacts
        contacts = self.getContactFromCNContact()
        for contact in contacts {
            
            print(contact.middleName)
            print(contact.familyName)
            
        }
        
        // Do any additional setup after loading the view.
    }

    
    func getContactFromCNContact() -> [CNContact] {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactGivenNameKey,
            CNContactMiddleNameKey,
            CNContactFamilyNameKey,
            CNContactEmailAddressesKey,
            ] as [Any]
        //Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        }
        catch {
            print("Error fetching containers") }
        // Iterate all containers and append their contacts to our results array
        var results: [CNContact] = []
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            }
            catch
            {
                print("Error fetching results for container")
            }
        }
        return results
    }
    
    
}



//MARK:- Delegate & DataSource Method For Tableview
extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Dhavalcell = tableView.dequeueReusableCell(withIdentifier: "DhavalContactCell", for: indexPath) as? DhavalContactCell
        Dhavalcell?.lblName.text = "\(contacts[indexPath.row].familyName) \(contacts[indexPath.row].givenName)"
        Dhavalcell?.lblContactnumber.text = "\(contacts[indexPath.row].identifier))"
        return Dhavalcell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
