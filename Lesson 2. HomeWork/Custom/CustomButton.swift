import UIKit

//MARK: - Custom button
final class CustomButton: UIButton {
    
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
        setTitleColor(.gray, for: .highlighted)
        layer.cornerRadius = 10
        backgroundColor = .systemBlue
        titleLabel?.font = .boldSystemFont(ofSize: 30)
    }
}

