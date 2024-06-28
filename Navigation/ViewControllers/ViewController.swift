import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupViewController()

    }
    private func setupViewController () {
        view.backgroundColor = .systemGreen
        title = "Post"
    }
}

