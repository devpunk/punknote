import UIKit

class VCreateCellDurationSlider:UIView
{
    private weak var viewBar:VCreateCellDurationSliderBar!
    private weak var labelDuration:UILabel!
    private weak var layoutBarWidth:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    private let kImageWidth:CGFloat = 45
    private let kLabelWidth:CGFloat = 200
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0.95, alpha:1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        layer.borderWidth = kBorderWidth
        layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        
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
        
        addSubview(viewBar)
        addSubview(image)
        addSubview(labelDuration)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:self)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar,
            toView:self,
            multiplier:0.5)
        
        NSLayoutConstraint.equalsVertical(
            view:image,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:image,
            toView:self)
        NSLayoutConstraint.width(
            view:image,
            constant:kImageWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelDuration,
            toView:image)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kLabelWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
