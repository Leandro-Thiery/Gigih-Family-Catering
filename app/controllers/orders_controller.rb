class OrdersController < ApplicationController
  def index
    @orders = Order.include(:customer).where("email = ?", params[:email])
  end

  def show
    @order = Order.find(params[:id])
    puts @order.order_details
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    if @order.save && !params[:details].nil?
      total = 0
      params[:details].each do |order_detail|
        item_price = MenuItem.where(id: order_detail[:menu_item_id]).pluck(:price)[0]
        detail = OrderDetail.new(order_id: @order[:id],
                                 menu_item_id: order_detail[:menu_item_id],
                                 quantity: order_detail[:quantity],
                                 item_price: item_price)
        if detail.save
          total += item_price * order_detail[:quantity].to_i
        else
          render :new, status: :unprocessable_entity
        end
      end

      @order.update(total: total)
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(update_params)
      redirect_to order_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id)
  end

  def update_params
    params.require(:order).permit(:status)
  end
end
