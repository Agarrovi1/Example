//
//  ViewController.swift
//  UserDefaults-Lab
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var noDefaultView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var horoscopeView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sunsignLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!
    
    //MARK: - Properties
    var horoscope = Horoscope() {
        didSet {
            showHoroscopeView()
            loadInfoToHoroscopeView()
        }
    }
    
    //MARK: - IBActions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if let text = nameTextField.text {
            let birthDate = getDateFromPicker()
            UserDefaultWrapper.manager.store(name: text)
            UserDefaultWrapper.manager.store(birthdayInfo: birthDate)
            loadHoroscopeData(birthDate: birthDate)
            showHoroscopeView()
        }
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        showNoDefaultView()
    }
    
    
    //MARK: - Private func
    private func loadHoroscopeData(birthDate: (String,String)) {
        let sunsign = getSignFromDate(tuple: birthDate)
        HoroscopeAPIHelper.manager.getHoroscopeInfo(sunsign: sunsign) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let horoscopeInfo):
                DispatchQueue.main.async {
                    self.horoscope = horoscopeInfo
                }
                
            }
        }
    }
    
    private func loadInfoToHoroscopeView() {
        guard let name = UserDefaultWrapper.manager.getName() else {return}
        nameLabel.text = "\(name), Here is your horoscope"
        sunsignLabel.text = horoscope.sunsign
        horoscopeTextView.text = horoscope.horoscope
    }
    private func loadDefaultInfo() {
        guard let birthdayInfo = UserDefaultWrapper.manager.getBirthday() else {return}
        loadHoroscopeData(birthDate: birthdayInfo)
    }
    
    private func showSpecificView() {
        if let _ = UserDefaultWrapper.manager.getName(), let _ = UserDefaultWrapper.manager.getBirthday() {
            showHoroscopeView()
        } else {
        showNoDefaultView()
        }
    }
    
    private func showHoroscopeView() {
        noDefaultView.isHidden = true
        horoscopeView.isHidden = false
    }
    
    private func showNoDefaultView() {
        noDefaultView.isHidden = false
        horoscopeView.isHidden = true
    }
    private func getDateFromPicker() -> (month: String, day: String) {
        let yearMonthDay = datePicker.date.description.components(separatedBy: .whitespaces)[0]
        let month = yearMonthDay.components(separatedBy: "-")[1]
        let day = yearMonthDay.components(separatedBy: "-")[2]
        return (month,day)
        //example: 2019-09-24
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpecificView()
        loadDefaultInfo()
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}
