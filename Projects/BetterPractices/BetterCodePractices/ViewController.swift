import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setButtonsUI()
    getLayout()
    
  }
    
    func getLayout() {
        if (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) == (.regular, .regular) {
            Layout().getDeviceType(device: .iPad, view: view)
        } else {
            Layout().getDeviceType(device: .iPhone, view: view)
        }
    }
    //TraitCollection - SizeClass it helps set behavior for which device the the code is running on
    //Strategy design pattern
  
    func setButtonsUI() {
        UIUtilities.styleFilledButton(button2)
        UIUtilities.styleHallowButton(button1)
    }
  
}

