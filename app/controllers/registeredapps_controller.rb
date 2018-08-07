class RegisteredappsController < ApplicationController
  def create
    @registeredapp = Registeredapp.new
    @registeredapp.name = params[:registeredapp][:name]
    @registeredapp.url = params[:registeredapp][:url]
    @registeredapp.user = current_user
     if @registeredapp.save
      flash[:notice] = "You successfully registered your app."
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was an error registering your app. Please try again."
      render :new
    end
  end
   def new
    @registeredapp = Registeredapp.new
  end
   def show
    @registeredapp = Registeredapp.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
    unless @registeredapp.user == current_user
      flash[:alert] = "You are not authorized to view this app."
      redirect_to root_path
    end
  end
   def index
    @registeredapps = []
    @allapps = Registeredapp.all
    @allapps.each do |app|
      if app.user == current_user
        @registeredapps << app
      end
    end
  end
   def edit
    @registeredapp = Registeredapp.find(params[:id])
  end
   def update
    @registeredapp = Registeredapp.find(params[:id])
    @registeredapp.name = params[:registeredapp][:name]
    @registeredapp.url = params[:registeredapp][:url]
     if @registeredapp.save
      flash[:notice] = "Registered app was updated successfully."
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was an error updating the registered app. Please try again."
      render :edit
    end
  end
   def destroy
    @registeredapp = Registeredapp.find(params[:id])
    if @registeredapp.destroy
      flash[:notice] = "\"#{@registeredapp.name}\" was deleted successfully."
      redirect_to registeredapps_path
    else
      flash.now[:alert] = "There was an error deleting the app. Try again?"
      render :show
    end
  end
end
