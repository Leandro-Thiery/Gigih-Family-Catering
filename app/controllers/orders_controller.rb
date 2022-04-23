class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders = @orders.filter_by_email(params[:email]) if params[:email].present?
    @orders = @orders.filter_by_min_price(params[:min_price]) if params[:min_price].present?
    @orders = @orders.filter_by_max_price(params[:max_price]) if params[:max_price].present?
    @orders = @orders.filter_by_start_date(params[:start_date]) if params[:start_date].present?
    @orders = @orders.filter_by_end_date(params[:end_date]) if params[:end_date].present?
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
    @order = Order.new(customer_id: params[:customer_id])
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
          render json: detail.errors, status: :unprocessable_entity
        end
      end

      @order.update(total: total)
      redirect_to orders_path
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status: params[:status])
      redirect_to order_path
    else
      puts @order.errors.to_hash
      render json: @order.errors, status: :unprocessable_entity
    end
  end
end
