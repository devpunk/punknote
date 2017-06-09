import UIKit

class VHomeCell:UICollectionViewCell
{
    private weak var model:MHomeItem?
    private weak var viewBackground:UIView?
    private weak var labelText:UILabel!
    private weak var labelDuration:UILabel!
    private let numberFormatter:NumberFormatter
    private let kBackgroundHeight:CGFloat = 80
    private let kBorderHeight:CGFloat = 1
    private let kTextMargin:CGFloat = 5
    private let kDurationHeight:CGFloat = 20
    private let kDurationWidth:CGFloat = 250
    private let kDurationLeft:CGFloat = 10
    private let kMaxDecimals:Int = 0
    private let kMinIntegers:Int = 1
    
    override init(frame:CGRect)
    {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.positiveSuffix = NSLocalizedString("VHomeCell_durationSeconds", comment:"")
        
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        let borderTop:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        let borderBottom:VBorder = VBorder(color:UIColor.black)
        
        let labelText:UILabel = UILabel()
        labelText.isUserInteractionEnabled = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.backgroundColor = UIColor.clear
        labelText.textColor = UIColor.white
        labelText.numberOfLines = 0
        labelText.textAlignment = NSTextAlignment.center
        self.labelText = labelText
        
        let labelDuration:UILabel = UILabel()
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.font = UIFont.regular(size:12)
        labelDuration.textColor = UIColor(white:0.4, alpha:1)
        self.labelDuration = labelDuration
        
        addSubview(borderTop)
        addSubview(borderBottom)
        addSubview(labelText)
        addSubview(labelDuration)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:self)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:borderBottom,
            toView:self,
            constant:kBackgroundHeight)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:borderTop,
            constant:kTextMargin)
        NSLayoutConstraint.bottomToBottom(
            view:labelText,
            toView:borderBottom,
            constant:-kTextMargin)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:kDurationHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelDuration,
            toView:self,
            constant:kDurationLeft)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kDurationWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addBackground(model:MHomeItem)
    {
        self.viewBackground?.removeFromSuperview()
        
        let viewBackground:UIView = model.background.view()
        self.viewBackground = viewBackground
        
        insertSubview(viewBackground, at:0)
        
        NSLayoutConstraint.topToTop(
            view:viewBackground,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBackground,
            constant:kBackgroundHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBackground,
            toView:self)
    }
    
    private func addFirstFrameText(model:MHomeItem)
    {
        guard
        
            let frames:[DNoteFrame] = model.note.frames?.array as? [DNoteFrame],
            let firstFrame:DNoteFrame = frames.first
        
        else
        {
            return
        }
        
        labelText.text = firstFrame.text
    }
    
    private func addDuration(model:MHomeItem)
    {
        let durationNumber:NSNumber = model.duration as NSNumber
        let durationString:String? = numberFormatter.string(from:durationNumber)
        labelDuration.text = durationString
    }
    
    //MARK: public
    
    func config(model:MHomeItem)
    {
        self.model = model
        
        labelText.font = model.font()
        addBackground(model:model)
        addFirstFrameText(model:model)
    }
}
