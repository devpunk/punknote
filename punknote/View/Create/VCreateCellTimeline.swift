import UIKit

class VCreateCellTimeline:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kInterItem:CGFloat = 2
    private let kBorderHeight:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor(white:0, alpha:0.02)
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellTimelineCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.minimumInteritemSpacing = kInterItem
            flow.minimumLineSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:0,
                left:kInterItem,
                bottom:0,
                right:kInterItem)
        }
        
        addSubview(collectionView)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        collectionView.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    override func config(controller:CCreate, model:MCreateContentProtocol)
    {
        super.config(controller:controller, model:model)
        collectionView.reloadData()
        
        let selected:Int = controller.model.selectedFrame
        let indexPath:IndexPath = IndexPath(item:selected, section:0)
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.left)
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateFrame
    {
        let item:MCreateFrame = controller!.model.frames[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY
        let size:CGSize = CGSize(width:height, height:height)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
            
            let count:Int = controller?.model.frames.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateFrame = modelAtIndex(index:indexPath)
        let cell:VCreateCellTimelineCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VCreateCellTimelineCell.reusableIdentifier,
            for:indexPath) as! VCreateCellTimelineCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        let item:MCreateFrame = modelAtIndex(index:indexPath)
    }
}
