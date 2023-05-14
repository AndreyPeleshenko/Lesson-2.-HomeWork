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
        stackViewConteiner.distribution = .equalSpacing
        
        stackViewConteiner.addArrangedSubview(trafficLightRedView)
        stackViewConteiner.addArrangedSubview(trafficLightYellowView)
        stackViewConteiner.addArrangedSubview(trafficLightGreenView)
    }
}

//MARK: - Layout
private extension TrafficLightViewController {
    func setupLayout() {
        [trafficLightButton,stackViewConteiner].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            trafficLightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            trafficLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trafficLightButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            trafficLightButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            stackViewConteiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewConteiner.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackViewConteiner.bottomAnchor.constraint(equalTo: trafficLightButton.topAnchor, constant: -100),
        ])
    }
}
