import UIKit

//MARK: - Custom button
final class CustomButton: UIButton {
    
    //MARK: - Override property
    override var isHighlighted: Bool {
        get { return super.isHighlighted }
        set {
            guard newValue != isHighlighted else { return }

            if newValue == true {
                titleLabel?.alpha = 0.25
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel?.alpha = 1
                }
                super.isHighlighted = newValue
            }

            super.isHighlighted = newValue
        }
    }
    
    //MARK: - Init method
    init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup custom button
    func setupButton(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        //setTitleColor(.gray, for: .highlighted) Это то решение, которое вы предлагали?
        layer.cornerRadius = 10
        backgroundColor = .systemBlue
        titleLabel?.font = .boldSystemFont(ofSize: 30)
    }
}

