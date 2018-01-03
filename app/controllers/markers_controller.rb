class MarkersController < ApplicationController
  before_action :set_marker, only: [:show]



  def index
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


  def display
    @list_markers = Marker.all
    end

def new
    @marker =Marker.new
end



def create


@marker = Marker.new(marker_params)
 if  @marker.save
   render action: "index", notice: 'Marker was successfully saved.'
 else
   render 'new'
 end
end


  private
    def set_marker
      @marker = Marker.find(params[:id])
    end



    private
    def marker_params
      params.permit(:lat, :lng, :year, :name, :avatar, :about, :website, :address)
    end





    def destroy
      @marker = Marker.find(params[:id])
      @marker.destroy
      redirect_to markers_path
    end












end
