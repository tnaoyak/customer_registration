class EventsController < ApplicationController
  def new
    @event = Event.new
    @school = School.new
  end

  def create
    school = School.create(school_params) unless school_params[:name] == ""
    event = Event.new(event_params)
    event.school_id = school.id unless school_params[:name] == ""
    event.save
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
      :image,
      :image_cache_id
    )
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
