class Product < ActiveRecord::Base
    validates :title, :description, :image_url, :price, :presence => true
    validates :price, :numericality => {:greater_than_or_equal_to => 1.0}
    validates :title, :uniqueness => true
    validates :image_url, :format => {
        :with => %r{\.(gif|jpg|jpeg|png)\Z}i,
        :message => 'Chỉ nhận các file gif, jpg, jpeg, png'
    }
    has_many :line_items
    # trước khi xóa nhắc hàm callback của lớp ActiveRecord::Base là before_destroy gọi phương thức check_if_has_line_item tự định nghĩa
    before_destroy :check_if_has_line_item
    # Chỉ định phạm vi truy xuất là private
    private
    def check_if_has_line_item
        # phương thức này sẽ kiểm tra xem 1 đối tượng Product có liên kết tới 1 đối tượng LineItem nào không
        if line_items.empty? # nếu không thì trả về true
            return true
        else # nếu có liên kết thì thông báo error, trả về false và không hủy đối tượng đó
            errors.add(:base, 'This product has a LineItem')
            return false
        end
    end
end
