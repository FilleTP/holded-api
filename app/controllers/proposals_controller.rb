class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    #parse the JSON objects??
    # @proposals.each do |proposal|
    #   objects = JSON.parse(proposal.object.items)
    #   proposal.object = objects
    # end

  end

  def new
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def create
    #save down object as string of JSON to DB
    @proposal = Proposal.new(proposal_params)
    @proposal.date = Time.now.to_i
    @proposal.contact_name = @proposal.customer.name
    send_propsals(@proposal)

    if @proposal.save
      redirect_to proposal_path(@proposal)
    else
      render :new
    end
  end



  private

  def proposal_params
    params.require(:proposal).permit(:customer_id, :name, :date, :due_date, :object_items)
  end


  def send_propsals(proposal)

    url = URI("https://api.holded.com/api/invoicing/v1/documents/estimate")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Accept"] = 'application/json'
    request["Content-Type"] = 'application/json'
    request["key"] = ENV["HOLDED_API"]
    request.body = { contactName: proposal.customer.name, date: proposal.date, name: proposal.name}.to_json

    response = http.request(request)

  end

end
