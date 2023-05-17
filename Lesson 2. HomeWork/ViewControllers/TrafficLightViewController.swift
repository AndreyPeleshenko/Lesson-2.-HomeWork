import UIKit

//MARK: - Traffic light view controller
final class TrafficLightViewController: UIViewController {
    
    //MARK: - Private property
    private let trafficLightButton = CustomButton(title: "START")
    
    private let trafficLightRedView = CustomView(color: .red)
    private let trafficLightYellowView = CustomView(color: .yellow)
    private let trafficLightGreenView = CustomView(color: .green)
    
    private let stackViewConteiner = UIStackView()
    
    private var colorOfLight = ColorOfLight.red
    
    //MARK: - Override method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        trafficLightRedView.layer.cornerRadius = trafficLightRedView.frame.width / 2
        trafficLightYellowView.layer.cornerRadius = trafficLightRedView.frame.width / 2
        trafficLightGreenView.layer.cornerRadius = trafficLightRedView.frame.width / 2
    }
    
    //MARK: - Change color method
    @objc
    func changeColor() {
        trafficLightButton.setTitle("NEXT", for: .normal)
        
        switch colorOfLight {
        case .red:
            trafficLightRedView.alpha = 1
            trafficLightGreenView.alpha = 0.3
            colorOfLight = .yellow
        case .yellow:
            trafficLightYellowView.alpha = 1
            trafficLightRedView.alpha = 0.3
            colorOfLight = .green
        case .green:
            trafficLightGreenView.alpha = 1
            trafficLightYellowView.alpha = 0.3
            colorOfLight = .red
        }
    }
}

//MARK: - Enum for switch color View
private extension TrafficLightViewController {
    enum ColorOfLight {
        case red
        case yellow
        case green
    }
}

//MARK: - Settings View
private extension TrafficLightViewController {
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addSubViews()
        
        showButton()
        setupStack()
        
        setupLayout()
    }
}

//MARK: - Settings
private extension TrafficLightViewController {
    func addSubViews() {
        [trafficLightButton, stackViewConteiner].forEach { view.addSubview($0) }
    }
    
    func showButton() {
        trafficLightButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }
    
    func setupStack() {
        stackViewConteiner.axis = .vertical
        stackViewConteiner.spacing = 30
        stackViewConteiner.distribution = .fillEqually
        stackViewConteiner.alignment = .fill
        
        [trafficLightRedView, trafficLightYellowView, trafficLightGreenView].forEach { stackViewConteiner.addArrangedSubview($0) }
    }
}

//MARK: - Layout
private extension TrafficLightViewController {
    func setupLayout() {
        [trafficLightButton, stackViewConteiner, trafficLightRedView, trafficLightYellowView, trafficLightGreenView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            trafficLightButton.heightAnchor.constraint(equalToConstant: 40),
            trafficLightButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            trafficLightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            trafficLightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            stackViewConteiner.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            stackViewConteiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewConteiner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
}
