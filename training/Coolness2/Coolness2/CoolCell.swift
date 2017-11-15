import UIKit
import QuartzCore

private let textInset = CGPoint(x: 5, y: 5)
private let textAttributes = [
    NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18),
    NSAttributedStringKey.foregroundColor: UIColor.white
]

@IBDesignable
class CoolCell: UIView {

    @IBInspectable var text: String? {
        didSet {
            self.sizeToFit()
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            guard let color = layer.borderColor else { return UIColor.white }
            return UIColor(cgColor: color)
        }
        set { layer.borderColor = newValue.cgColor }
    }

    var highlighted: Bool = false {
        willSet {
            alpha = newValue ? 0.5 : 1.0
        }
    }

    override init(frame: CGRect) {
        // Need to be sure to initialize any custom properties without default values before calling super.
        super.init(frame: frame)

        configureLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureLayer()
    }
}

// MARK: - Animation
extension CoolCell {

    @IBAction func bounce() {
        animateBounce(duration: 1, size: CGSize(width: 120, height: 240))
    }

    func configureBounce(duration: TimeInterval, size: CGSize) {
        UIView.setAnimationRepeatCount(1.5)
        UIView.setAnimationRepeatAutoreverses(true)

        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        transform = translation.rotated(by: CGFloat(.pi * 0.5))
    }

    func configureFinalBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration) {
            [weak self] in self?.transform = CGAffineTransform.identity
        }
    }

    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration,
                animations: { [weak self] in self?.configureBounce(duration: duration, size: size) },
                completion: { [weak self] _ in self?.configureFinalBounce(duration: duration, size: size) })
    }
}

// MARK: - View Drawing
extension CoolCell {
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textInset, withAttributes: textAttributes)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(withAttributes: textAttributes)
        newSize.width += textInset.x * 2
        newSize.height += textInset.y * 2

        return newSize
    }

    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = true
    }

    private func configureLayer() {
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true

        configureGestureRecognizers()
    }

    private func configureGestureRecognizers() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        tapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(tapRecognizer)
    }
}

// MARK: - Responder Methods
extension CoolCell {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.highlighted = true

//        guard let touch = touches.first else { return }
//        touch.view?.superview?.bringSubview(toFront: touch.view!)

        guard
                let touch = touches.first,
                let view = touch.view
        else { return }

        view.superview?.bringSubview(toFront: view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: nil)
        let previousLocation = touch.previousLocation(in: nil)

        self.center.x += touchLocation.x - previousLocation.x
        self.center.y += touchLocation.y - previousLocation.y
    }

    // Shared methods for both ended and cancelled state changes.
    func touchesFinish(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.highlighted = false
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesFinish(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesFinish(touches, with: event)
    }
}

