import UIKit

//MARK: - Custom view
final class CustomView: UIView {
    
    //MARK: - Init method
    init(color: UIColor) {
        super.init(frame: .zero)
        setupView(color: color)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup view
    func setupView(color: UIColor) {
        setupLayout()
        
        backgroundColor = color
        alpha = 0.3
    }
}


//MARK: - Layout
private extension CustomView {
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
        ])
    }
}
