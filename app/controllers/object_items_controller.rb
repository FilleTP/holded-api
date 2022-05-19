class ObjectItemsController < ApplicationController

  def new

    @object_item = ObjectItem.new
  end

  def index
    @object_items = ObjectItem.all
  end

  def create
    @object_item.proposal_id = Proposal.find(params[:proposal_id])
    @object_item = ObjectItem.new(object_item_params)

  end

  private

  def object_item_params
    params.require(:object_item).permit(:proposal_id, :name, :desc, :units, :sku, :service_id, :accounting_account_id, :subtotal, :discount, :tax, :retention, :equivalance_surcharge, :tags)
  end


end
