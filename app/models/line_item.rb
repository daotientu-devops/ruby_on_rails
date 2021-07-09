class LineItem < ApplicationRecord
    # phương thức belongs_to cho biết một đối tượng LineItem sẽ 'thuộc về' 1 đối tượng nào đó, ở đây là Product và Cart
    # Phương thức này bắt rails phải hiểu rằng sẽ không bao giờ tồn tại một đối tượng LineItem nào mà không liên kết/thuộc về 1 đối tượng Cart và Product nào đó
    # Khi một đối tượng LineItem 'thuộc về' 1 đối tượng Product và Cart thì chúng ta có thể truy xuất các đối tượng Product và Card trong đối tượng LineItem
    belongs_to :product
    belongs_to :cart
end
