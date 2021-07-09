# Tất cả các lớp controller do rails tạo ra đều được kế thừa từ lớp ApplicationController, lớp này cũng là một lớp do rails tạo ra và được kế thừa từ lớp ActionController::Base
class ApplicationController < ActionController::Base
    # prevent csrf attacks by raising an exception
    # for apis, you may want to use :null_session instead
    protect_from_forgery with: :exception
    # Chỉ định phạm vi truy xuất là private
    private
    # Đầu tiên tìm xem trong CSDL có giỏ hàng nào có id giống với phần tử có khóa là :cart_id trong session hay không bằng phương thức Cart.find()
    # , nếu không có thì phương thức này sẽ giải phóng một exception là ActiveRecord::RecordNotFound
    # , chúng ta bắt lỗi này và thực hiện tạo một đối tượng Cart mới, sau đó tạo một phần tử trong đối tượng session với khóa là :cart_id và giá trị là id mới vừa được tạo (thuộc tính id - cart.id)
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart    
    end
end
