import UIKit

class VCreateCellFontName:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let interItem2:CGFloat
    private let kInterItem:CGFloat = 3
    private let kCellWidth:CGFloat = 100
    
    override init(frame:CGRect)
    {
        interItem2 = kInterItem + kInterItem
        super.init(frame:frame)
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellFontNameCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInterItem,
                left:kInterItem,
                bottom:kInterItem,
                right:kInterItem)
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
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateFontItem
    {
        let item:MCreateFontItem = controller!.model.font.fonts[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY - interItem2
        let size:CGSize = CGSize(width:kCellWidth, height:height)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = controller?.model.font.fonts.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateFontItem = modelAtIndex(index:indexPath)
        let cell:VCreateCellFontNameCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VCreateCellFontNameCell.reusableIdentifier,
            for:indexPath) as! VCreateCellFontNameCell
        cell.config(model:item)
        
        return cell
    }
}
