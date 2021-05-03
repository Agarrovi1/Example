//
//  ClientViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    @IBOutlet weak var clientTableView: UITableView!
    var clientWrap = ClientWrapper() {
        didSet {
            let clientIds = giveAllClients(wrapper: clientWrap)
            loadClients(arr: clientIds)
            
        }
    }
    var clients = [Client]() {
        didSet {
            clientTableView.reloadData()
        }
    }
    
    private func loadClientWrap() {
        ProjectAPIClient.manager.getClientWrapperInfo { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let clientWrapInfo):
                    self.clientWrap = clientWrapInfo
                }
            }
        }
    }
    private func loadClients(arr: [String]) {
        var newArr = [Client]()
        for a in arr {
            let aClient = loadOneClientInfo(for: a)
            newArr.append(aClient)
        }
        //clients = newArr
    }
    private func loadOneClientInfo(for id: String) -> Client {
        var client: Client = Client()
        DispatchQueue.main.async {
            ProjectAPIClient.manager.getClientInfo(id: id, completionHandler: { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let clientFromUrl):
                    client = clientFromUrl
                    self.clients.append(client)
                    dump(client)
                }
            })
        }
        
        return client
    }
    private func setDelegates() {
        clientTableView.dataSource = self
        clientTableView.delegate = self
    }
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
    setDelegates()
    loadClientWrap()
    }

}
extension ClientViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = clientTableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath) as? ClientTableViewCell else {return UITableViewCell()}
        let client = clients[indexPath.row]
        cell.clientNameLabel.text = client.fields.name
        ImageHelper.getImage(url: client.fields.getLargeImageUrl()) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    cell.clientLogoImage.image = image
                }
            }
        }
        return cell
    }
    
    
}
extension ClientViewController: UITableViewDelegate {
    
}
