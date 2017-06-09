import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var viewCircle:UIView!
    private weak var viewSelected:VCreateCellTimelineCellSelected!
    private weak var viewBorder:VBorder!
    private weak var labelDuration:UILabel!
    private weak var layoutCircleLeft:NSLayoutConstraint!
    private weak var modelFrame:MCreateFrame?
    private weak var controller:CCreate?
    private weak var labelText:UILabel!
    private var index:IndexPath?
    private let numberFormatter:NumberFormatter
    private let selectedSize:CGFloat
    private let kCircleTop:CGFloat = 10
    private let kCircleSize:CGFloat = 60
    private let kSelectedMargin:CGFloat = 5
    private let kLabelMargin:CGFloat = 4
    private let kRibbonHeight:CGFloat = 6
    private let kBorderWidth:CGFloat = 6
    private let kDurationRight:CGFloat = -5
    private let kDurationWidth:CGFloat = 150
    private let kDurationHeight:CGFloat = 20
    private let kMaxDecimals:Int = 0
    private let KMinIntegers:Int = 1
    
    override init(frame:CGRect)
    {
        selectedSize = kCircleSize + kSelectedMargin + kSelectedMargin
        numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = KMinIntegers
        numberFormatter.positiveSuffix = NSLocalizedString("VCreateCellTimelineCell_secondsSuffix", comment:"")
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let bordersColor:UIColor = UIColor.punkPurple.withAlphaComponent(0.6)
        let viewRibbon:VBorder = VBorder(color:bordersColor)
        let viewBorder:VBorder = VBorder(color:bordersColor)
        self.viewBorder = viewBorder
        
        let circleCornerRadius:CGFloat = kCircleSize / 2.0
        let labelCornerRadius:CGFloat = circleCornerRadius - kLabelMargin
        
        let viewCircle:UIView = UIView()
        viewCircle.clipsToBounds = true
        viewCircle.isUserInteractionEnabled = false
        viewCircle.translatesAutoresizingMaskIntoConstraints = false
        viewCircle.backgroundColor = UIColor.clear
        viewCircle.layer.cornerRadius = circleCornerRadius
        viewCircle.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        self.viewCircle = viewCircle
        
        let viewSelected:VCreateCellTimelineCellSelected = VCreateCellTimelineCellSelected()
        self.viewSelected = viewSelected
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.isUserInteractionEnabled = false
        labelDuration.font = UIFont.regular(size:13)
        labelDuration.textColor = UIColor.black
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.textAlignment = NSTextAlignment.right
        self.labelDuration = labelDuration
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkPurple,
            colorTopRight:UIColor.punkOrange)
        viewGradient.mask = viewSelected
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.textAlignment = NSTextAlignment.center
        labelText.numberOfLines = 0
        labelText.textColor = UIColor.black
        labelText.font = UIFont.regular(size:11)
        labelText.clipsToBounds = true
        labelText.layer.cornerRadius = labelCornerRadius
        self.labelText = labelText
        
        addSubview(labelDuration)
        addSubview(viewBorder)
        addSubview(viewRibbon)
        addSubview(labelText)
        addSubview(viewGradient)
        addSubview(viewCircle)
        
        NSLayoutConstraint.topToTop(
            view:viewCircle,
            toView:self,
            constant:kCircleTop)
        NSLayoutConstraint.size(
            view:viewCircle,
            constant:kCircleSize)
        layoutCircleLeft = NSLayoutConstraint.leftToLeft(
            view:viewCircle,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:labelText,
            toView:viewCircle,
            margin:kLabelMargin)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewRibbon,
            toView:self)
        NSLayoutConstraint.height(
            view:viewRibbon,
            constant:kRibbonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewRibbon,
            toView:self)
        
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:kDurationHeight)
        NSLayoutConstraint.bottomToTop(
            view:viewBorder,
            toView:viewRibbon)
        NSLayoutConstraint.rightToRight(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.width(
            view:viewBorder,
            constant:kBorderWidth)
        
        NSLayoutConstraint.bottomToTop(
            view:labelDuration,
            toView:viewRibbon)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:kDurationHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelDuration,
            toView:viewBorder,
            constant:kDurationRight)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kDurationWidth)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedTextChanged(sender:)),
            name:Notification.frameTextChanged,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        viewSelected.timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainCircle:CGFloat = width - kCircleSize
        let marginLeft:CGFloat = remainCircle / 2.0
        layoutCircleLeft.constant = marginLeft
        
        let selectedLeft:CGFloat = marginLeft - kSelectedMargin
        let selectedTop:CGFloat = kCircleTop - kSelectedMargin
        
        viewSelected.frame = CGRect(
            x:selectedLeft,
            y:selectedTop,
            width:selectedSize,
            height:selectedSize)
        
        super.layoutSubviews()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: notifications
    
    func notifiedTextChanged(sender notification:Notification)
    {
        guard
        
            let modelFrame:MCreateFrame = self.modelFrame,
            let notificationFrame:MCreateFrame = notification.object as? MCreateFrame
        
        else
        {
            return
        }
        
        if modelFrame === notificationFrame
        {
            DispatchQueue.main.async
            { [weak self] in
                
                self?.updateText()
            }
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        guard
        
            let modelFrame:MCreateFrame = self.modelFrame
        
        else
        {
            return
        }
        
        if isSelected || isHighlighted
        {
            viewSelected.selected(isSelected:true, model:modelFrame)
            viewSelected.isHidden = false
            viewCircle.layer.borderWidth = 0
        }
        else
        {
            viewSelected.selected(isSelected:false, model:modelFrame)
            viewSelected.isHidden = true
            viewCircle.layer.borderWidth = 1
        }
        
        checkLast()
    }
    
    private func updateText()
    {
        guard
        
            let modelFrame:MCreateFrame = self.modelFrame
        
        else
        {
            return
        }
        
        labelText.text = modelFrame.text
    }
    
    private func checkLast()
    {
        guard
            
            let controller:CCreate = self.controller,
            let index:IndexPath = self.index
            
        else
        {
            return
        }
        
        let countFrames:Int = controller.model.frames.count
        let currentFrame:Int = index.item + 1
        
        if countFrames == currentFrame
        {
            lastCell()
        }
        else
        {
            notLastCell()
        }
    }
    
    private func lastCell()
    {
        guard
            
            let frames:[MCreateFrame] = controller?.model.frames
        
        else
        {
            return
        }
        
        var duration:TimeInterval = 0
        
        for frame:MCreateFrame in frames
        {
            duration += frame.duration
        }
        
        let numberDuration:NSNumber = duration as NSNumber
        let stringDuration:String? = numberFormatter.string(from:numberDuration)
        
        viewBorder.isHidden = false
        labelDuration.isHidden = false
        labelDuration.text = stringDuration
    }
    
    private func notLastCell()
    {
        viewBorder.isHidden = true
        labelDuration.isHidden = true
    }
    
    //MARK: public
    
    func config(controller:CCreate?, model:MCreateFrame, index:IndexPath)
    {
        viewSelected.timer?.invalidate()
        self.modelFrame = model
        self.controller = controller
        self.index = index
        
        hover()
        updateText()
    }
}
