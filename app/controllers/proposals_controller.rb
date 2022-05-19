class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    #parse the JSON objects
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
    @pvgi = Pvgi.find_by(proposal_id: @proposal.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "/proposals/show.html.erb", layout: "pdf", :javascript_delay => 5000 # Excluding ".pdf" extension.
      end
    end

  end

  def create
    #save down object as string of JSON to DB


    @proposal = Proposal.new(proposal_params)
    @proposal.date = Time.now.to_i
    @proposal.contact_name = @proposal.customer.name




    if @proposal.save!
      string_creation
      # send_propsals(@proposal)
      redirect_to proposal_path(@proposal)
    else
      render :new
    end
  end



  private

  def proposal_params
    params.require(:proposal).permit(:name, :date, :due_date, :customer_id)
  end

  def string_creation
    @string1 = Pvgisdata.new(lat: params["proposal"]["pvgisdata"]["lat_1"], lon: params["proposal"]["pvgisdata"]["lon_1"], peakpower: params["proposal"]["pvgisdata"]["peakpower_1"], angle: params["proposal"]["pvgisdata"]["angle_1"], loss: params["proposal"]["pvgisdata"]["loss_1"], slope: params["proposal"]["pvgisdata"]["slope_1"], azimuth: params["proposal"]["pvgisdata"]["azimuth_1"])

    response_string_1 = PvgisApi.new(@string1, @proposal).call_pvgis
    obj = JSON.parse(response_string_1.body)
    @first_string = Pvgi.new(
      proposal_id: @proposal.id,
      name: 'string1',
      month1: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month2: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month3: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month4: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month5: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month6: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month7: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month8: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month9: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month10: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month11: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] },
      month12: { E_d: obj["outputs"]["monthly"]["fixed"][0]["E_d"], E_m: obj["outputs"]["monthly"]["fixed"][0]["E_m"], Hi_d: obj["outputs"]["monthly"]["fixed"][0]["H(i)_d"], Hi_m: obj["outputs"]["monthly"]["fixed"][0]["H(i)_m"], SD_m: obj["outputs"]["monthly"]["fixed"][0]["SD_m"] }
    )

    @first_string.save!

    # response_1 = response_string_1.body.delete!('\\')
    if params["proposal"]["pvgisdata"]["lat_2"] != ""
    @string2 = Pvgisdata.new(lat: params["proposal"]["pvgisdata"]["lat_2"], lon: params["proposal"]["pvgisdata"]["lon_2"], peakpower: params["proposal"]["pvgisdata"]["peakpower_2"], angle: params["proposal"]["pvgisdata"]["angle_2"], loss: params["proposal"]["pvgisdata"]["loss_2"], slope: params["proposal"]["pvgisdata"]["slope_2"], azimuth: params["proposal"]["pvgisdata"]["azimuth_2"])
    response_string_2 = PvgisApi.new(@string2, @proposal).call_pvgis
    response_string_2_json = response_string_2.to_json
    end
    if params["proposal"]["pvgisdata"]["lat_3"] != ""
    @string3 = Pvgisdata.new(lat: params["proposal"]["pvgisdata"]["lat_3"], lon: params["proposal"]["pvgisdata"]["lon_3"], peakpower: params["proposal"]["pvgisdata"]["peakpower_3"], angle: params["proposal"]["pvgisdata"]["angle_3"], loss: params["proposal"]["pvgisdata"]["loss_3"], slope: params["proposal"]["pvgisdata"]["slope_3"], azimuth: params["proposal"]["pvgisdata"]["azimuth_3"])
    response_string_3 = PvgisApi.new(@string3, @proposal).call_pvgis
    response_string_3_json = response_string_3.to_json
    end

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
