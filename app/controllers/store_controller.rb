class StoreController < ApplicationController
  def index
    @products = Product.all # tham chiếu tới model Product và gọi phương thức all là lấy được danh sách các đối tượng (hay các bản ghi trong CSDL) của model đó
  end
end
