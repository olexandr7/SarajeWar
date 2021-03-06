class MarkersController < ApplicationController
  before_action :set_marker, only: [:show]
  #http_basic_authenticate_with name: "admin", password: "secret", only: [:new, :edit, :destroy]
   http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :all,:show]

  def index
    respond_to do |format|
  format.html
  format.json {
    pluck_fields = Marker.pluck(:id, :lat, :lng)
    render json: Oj.dump(pluck_fields)
  }
end
  end


  def display
    #@list_markers = Marker.all
    @list_markers = Marker.all.paginate :page => params[:page], :per_page => 10
    end



def new
    @marker =Marker.new
end


def create
@marker = Marker.new(add_params)
 if  @marker.save
    redirect_to "/all", notice: 'Marker was successfully saved.'
 else
   render 'new'
 end
end


def edit
   @marker = Marker.find(params[:id])
 end



 def update
   @marker = Marker.find(params[:id])

   if @marker.update(edit_params)
     redirect_to "/all"
          #render :action => :show
   else
     render :action => :edit
   end
 end


 def destroy
   @marker = Marker.find(params[:id])
   @marker.destroy
   #redirect_to markers_path
   redirect_to "/all"
 end



def show
    render "show", layout: false
end


  private
    def set_marker
      @marker = Marker.find(params[:id])
    end



  private

    def add_params
        params.permit(:lat, :lng, :year, :name, :avatar, :about, :website, :address)
    end

    def edit_params
      params.require(:marker).permit!
    end
















end
