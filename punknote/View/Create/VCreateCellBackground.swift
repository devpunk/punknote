import UIKit

class VCreateCellBackground:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kCellWidth:CGFloat = 100
    private let kInterItem:CGFloat = 2
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellBackgroundCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate, model:MCreateContentProtocol)
    {
        super.config(controller:controller, model:model)
        collectionView.reloadData()
        selectCurrentItem()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateBackgroundProtocol
    {
        let item:MCreateBackgroundProtocol = controller!.model.backgrounds[index.item]
        
        return item
    }
    
    private func selectCurrentItem()
    {
        guard
        
            let selectedBackground:Int = controller?.model.selectedBackground
        
        else
        {
            return
        }
        
        let index:IndexPath = IndexPath(item:selectedBackground, section:0)
        collectionView.selectItem(
            at:index,
            animated:false,
            scrollPosition:UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = bounds.size.height
        let size:CGSize = CGSize(width:kCellWidth, height:height)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        guard
        
            let count:Int = controller?.model.backgrounds.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateBackgroundProtocol = modelAtIndex(index:indexPath)
        let cell:VCreateCellBackgroundCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VCreateCellBackgroundCell.reusableIdentifier,
            for:indexPath) as! VCreateCellBackgroundCell
        cell.config(model:item)
        
        return cell
    }
}
