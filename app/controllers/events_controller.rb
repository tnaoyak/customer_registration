class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.build_image
    @school = School.new
    @image = Image.new
  end

  def create
    school = School.create(school_params) unless school_params[:name] == ""
    event = Event.new(event_params)
    event.school_id = school.id unless school_params[:name] == ""
    event.save
    redirect_to event_path(event.id), notice: "イベントを登録しました"
  end

  def index
    @events = Event.all.includes([:school, :image]).order("created_at ASC").page(params[:page]).per(10)
  end

  def show
    @event = Event.includes([:school, :image]).find(params[:id])
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
      :public_start_date,
      :public_end_date,
      :remarks,
      image_attributes: [
      :image,
      :image_cache_id
      ]
    )
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
