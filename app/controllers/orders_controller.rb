class OrdersController < ApplicationController

  def index
    @orders = Order.where(params.permit(
      :reference, :user_id, :status_id, :delivery_service_id,
      :purchase_channel_id
    )).offset(params[:offset]).limit(params[:limit])

    render json: @orders
  end

  def create
    @order = Order.create(params.permit(
        :reference, :address, :line_items, :total_value,
        :user_id, :delivery_service_id, :purchase_channel_id
      ).merge(status_id: Status::READY))

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
end
