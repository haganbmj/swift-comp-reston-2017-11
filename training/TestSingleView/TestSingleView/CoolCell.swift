import UIKit
import QuartzCore

private let textInset = CGPoint(x: 20, y: 30)
private let textAttributes = [
    NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18),
    NSAttributedStringKey.foregroundColor: UIColor.white
]

class CoolCell: UIView {

    var text: String?
    var highlighted: Bool = false {
        willSet {
            alpha = newValue ? 0.5 : 1.0
        }
    }

    override init(frame: CGRect) {
        // Need to be sure to initialize any custom properties without default values before calling super.
        super.init(frame: frame)

        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        tapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(tapRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Animation
extension CoolCell {

    @objc func bounce() {
        animateBounce(duration: 1, size: CGSize(width: 120, height: 240))
    }

    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration) { [weak self] in
            guard let frame = self?.frame else { return }
            self?.frame = frame.offsetBy(dx: size.width, dy: size.height)
        }
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
