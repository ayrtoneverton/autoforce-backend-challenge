class ReportController < ApplicationController

  # GET
  def index
    @result = Order.joins(:purchase_channel).group('purchase_channels.id')
      .select('purchase_channels.*, count(*) as count_orders, sum(total_value) as sum_total_orders')

    render json: @result, status: :accepted
  end
end
