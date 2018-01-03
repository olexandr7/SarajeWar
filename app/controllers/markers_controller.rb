class MarkersController < ApplicationController
  before_action :set_marker, only: [:show]


  def index
    #@list_markers = Marker.all.paginate :page => params[:page], :per_page => 10
    @list_markers = Marker.all #used to export all entries (not just 10 paginated on page) into other formats
  end


  def map
    respond_to do |format|
  format.html
  format.json {
    pluck_fields = Marker.pluck(:id, :lat, :lng)
    render json: Oj.dump(pluck_fields)
  }
end
  end


  def show
        render "show", layout: false
  end




    def destroy
      @marker = Marker.find(params[:id])
      @marker.destroy
      redirect_to markers_path
    end


def create
  @marker = Marker.new(marker_params)

   if  @marker.save
     redirect_to @marker, notice: 'Marker was successfully created.'
   else
     render 'new'
   end
end


def edit
@marker = Marker.find(params[:id])
end





private
  def set_marker
    @marker = Marker.find(params[:id])
  end






end
