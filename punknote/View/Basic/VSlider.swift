import UIKit

class VSlider:UIView
{
    private weak var controller:CCreate?
    private weak var model:MCreateFrame?
    private weak var viewBase:UIView!
    private weak var viewBar:VCreateCellDurationSliderBar!
    private weak var labelDuration:UILabel!
    private weak var layoutBarWidth:NSLayoutConstraint!
    private var panInitialWidth:CGFloat?
    private let numberFormatter:NumberFormatter
    private let deltaDuration:TimeInterval
    private let kHorizontalMargin:CGFloat = 10
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    private let kImageWidth:CGFloat = 45
    private let kLabelWidth:CGFloat = 200
    private let kMaxDuration:TimeInterval = 15
    private let kMinDuration:TimeInterval = 1
    private let kMaxDecimals:Int = 0
    private let kMinIntergers:Int = 1
    private let kAfterUpdated:TimeInterval = 0.2
    
    init()
    {
        deltaDuration = kMaxDuration - kMinDuration
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = kMinIntergers
        numberFormatter.positiveSuffix = NSLocalizedString("VCreateCellDurationSlider_secondsSuffix", comment:"")
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewBase:UIView = UIView()
        viewBase.clipsToBounds = true
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
    
    private func durationMeasure()
    {
        let width:CGFloat = viewBase.bounds.maxX
        
        if width != 0
        {
            let currentWidth:CGFloat = layoutBarWidth.constant
            let percentWidth:CGFloat = currentWidth / width
            let percentDuration:TimeInterval = deltaDuration * TimeInterval(percentWidth)
            let realDuration:TimeInterval = percentDuration + kMinDuration
            model?.duration = realDuration
            
            DispatchQueue.main.async
                { [weak self] in
                    
                    self?.printDuration()
            }
        }
    }
    
    private func printDuration()
    {
        guard
            
            let model:MCreateFrame = self.model
            
            else
        {
            return
        }
        
        let duration:NSNumber = model.duration as NSNumber
        let durationString:String? = numberFormatter.string(from:duration)
        
        labelDuration.text = durationString
    }
    
    private func gestureBegan(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = layoutBarWidth.constant
    }
    
    private func gestureChanged(gesture:UIPanGestureRecognizer)
    {
        guard
            
            let panInitialWidth:CGFloat = self.panInitialWidth
            
            else
        {
            return
        }
        
        let width:CGFloat = viewBase.bounds.maxX
        let translationX:CGFloat = gesture.translation(in:self).x
        var newWidth:CGFloat = panInitialWidth + translationX
        
        if newWidth < 0
        {
            newWidth = 0
        }
        else if newWidth > width
        {
            newWidth = width
        }
        
        layoutBarWidth.constant = newWidth
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
                self?.durationMeasure()
        }
    }
    
    private func gestureEnded(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = nil
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterUpdated)
        { [weak self] in
            
            self?.controller?.refreshFrame()
        }
    }
    
    //MARK: public
    
    func config(controller:CCreate, model:MCreateFrame)
    {
        self.controller = controller
        self.model = model
        layoutDuration()
        printDuration()
    }
}
