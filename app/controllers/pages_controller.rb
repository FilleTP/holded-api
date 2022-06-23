class PagesController < ApplicationController

  def home
    @proposals = Proposal.last(3)
  end

  private

  def solar_data_params
    params.require(:solar_data).permit(:lat, :lon, :angle, :batterysize, :cutoff, :consumptionday, :loss, :slope, :azimuth)
  end

end
