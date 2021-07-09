class Cart < ActiveRecord::Base
    # phương thức has_many :line_items chỉ định một đối tượng Cart sẽ có nhiều liên kết tới đối tượng LineItem
    # , tham số :dependent => :destroy cho biết khi một đối tượng Cart bị hủy thì đối tượng LineItem đó cũng sẽ bị hủy theo
    has_many :line_items, :dependent => :destroy
end
