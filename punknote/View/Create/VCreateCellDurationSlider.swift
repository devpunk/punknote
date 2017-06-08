import UIKit

class VCreateCellDurationSlider:UIView
{
    private weak var model:MCreateFrame?
    private weak var viewBase:UIView!
    private weak var viewBar:VCreateCellDurationSliderBar!
    private weak var labelDuration:UILabel!
    private weak var layoutBarWidth:NSLayoutConstraint!
    private var panOriginX:CGFloat?
    private let deltaDuration:TimeInterval
    private let kHorizontalMargin:CGFloat = 10
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    private let kImageWidth:CGFloat = 45
    private let kLabelWidth:CGFloat = 200
    private let kMaxDuration:TimeInterval = 10
    private let kMinDuration:TimeInterval = 1
    
    init()
    {
        deltaDuration = kMaxDuration - kMinDuration
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewBase:UIView = UIView()
        viewBase.backgroundColor = UIColor(white:0.95, alpha:1)
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.layer.cornerRadius = kCornerRadius
        viewBase.layer.borderWidth = kBorderWidth
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        self.viewBase = viewBase
        
        let viewBar:VCreateCellDurationSliderBar = VCreateCellDurationSliderBar()
        self.viewBar = viewBar
        
        let image:UIImageView = UIImageView()
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.image = #imageLiteral(resourceName: "assetGenericCreateDuration")
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.textColor = UIColor.black
        labelDuration.font = UIFont.regular(size:15)
        labelDuration.text = "14 secs"
        self.labelDuration = labelDuration
        
        viewBase.addSubview(viewBar)
        addSubview(viewBase)
        addSubview(image)
        addSubview(labelDuration)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBase,
            toView:self,
            margin:kHorizontalMargin)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:viewBase)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:viewBase)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
        
        NSLayoutConstraint.equalsVertical(
            view:image,
            toView:viewBase)
        NSLayoutConstraint.leftToLeft(
            view:image,
            toView:viewBase)
        NSLayoutConstraint.width(
            view:image,
            constant:kImageWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDuration,
            toView:viewBase)
        NSLayoutConstraint.leftToRight(
            view:labelDuration,
            toView:image)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kLabelWidth)
        
        let gesture:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(actionPanning(sender:)))
        
        addGestureRecognizer(gesture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        layoutDuration()
    }
    
    //MARK: actions
    
    func actionPanning(sender gesture:UIPanGestureRecognizer)
    {
        switch gesture.state
        {
        case UIGestureRecognizerState.began,
             UIGestureRecognizerState.possible:
            
            gestureBegan(gesture:gesture)
            
            break
            
        case UIGestureRecognizerState.changed:
            
            gestureChanged(gesture:gesture)
            
            break
            
        case UIGestureRecognizerState.ended,
             UIGestureRecognizerState.failed,
             UIGestureRecognizerState.cancelled:
        
            gestureEnded(gesture:gesture)
            
            break
        }
    }
    
    //MARK: private
    
    private func layoutDuration()
    {
        guard
        
            let model:MCreateFrame = self.model
        
        else
        {
            return
        }
        
        let minDuration:TimeInterval = model.duration - kMinDuration
        let percentDuration:TimeInterval = minDuration / deltaDuration
        let width:CGFloat = viewBase.bounds.maxX
        let percentWidth:CGFloat = CGFloat(percentDuration) * width
        layoutBarWidth.constant = percentWidth
    }
    
    private func gestureBegan(gesture:UIPanGestureRecognizer)
    {
        
    }
    
    private func gestureChanged(gesture:UIPanGestureRecognizer)
    {
        guard
        
            let panOriginX:CGFloat = self.panOriginX
        
        else
        {
            return
        }
        
        let width:CGFloat = bounds.maxX
        let translationX:CGFloat = gesture.translation(in:self).x
    }
    
    private func gestureEnded(gesture:UIPanGestureRecognizer)
    {
        
    }
    
    //MARK: public
    
    func config(model:MCreateFrame)
    {
        self.model = model
        layoutDuration()
    }
}
