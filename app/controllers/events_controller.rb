class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.images.build
    @school = School.new
    @image = Image.new
  end

  def create
    school = School.create(school_params) unless school_params[:name] == ""
    event = Event.new(event_params)
    event.school_id = school.id unless school_params[:name] == ""
    event.save
    redirect_to root_path
  end

  def index

  end

  def show

  end

  def edit
    
  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :school_id,
      :web_public,
      :public_stert_date,
      :public_end_date,
      :remarks,
      images_attributes: [
      :image,
      :image_cache_id
      ]
    )
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
