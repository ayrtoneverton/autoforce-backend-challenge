class BatchesController < ApplicationController

  # POST
  def create
    @last = Batch.select(:reference).last
    @last = @last && @last.reference
    @reference = Time.now.strftime('%Y%m-')

    if @last and @last[@reference]
      @reference += (@last.split(/-/)[1].to_i + 1).to_s
    else
      @reference += '1'
    end

    @batch = Batch.create(params.permit(:purchase_channel_id).merge(reference: @reference))

    if @batch.save
      @count = Order.where(params.permit(:purchase_channel_id).merge(status_id: Status::READY))
        .update_all(status_id: Status::PRODUCTION, batch_id: @batch.id)

      render json: { reference: @reference, count_orders: @count }, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    @count = Order.where(params.permit(:delivery_service_id).merge(batch_id: params[:id]))
      .update_all(status_id: params[:delivery_service_id] ? Status::SENT : Status::CLOSING)

    render json: { count_orders_moved: @count }, status: :accepted
  end
end
