class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :destroy]

  def new
    @event = Event.new
    @event.build_image
    @school = School.new
  end

  def create
    school = School.create(school_params) unless school_params[:name] == ""
    event = Event.new(event_params)
    event.school_id = school.id unless school_params[:name] == ""
    if event.save
      redirect_to event_path(event.id), notice: "イベントを登録しました"
    else
      flash[:notice] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @events = Event.all.includes([:school, :image]).order("created_at ASC").page(params[:page]).per(10)
  end

  def show
  end

  def edit
    @school = School.new
  end

  def update
    school = School.create(school_params) unless school_params[:name] == ""
    @event = Event.includes([:school, :image]).find(params[:id])
    @event.school_id = school.id unless school_params[:name] == ""
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice: "イベントを編集しました"
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, notice: "イベントを削除しました"
    else
      flash[:notice] = "削除に失敗しました"
      render :show
    end
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
      :id,
      :image,
      :image_cache_id
      ]
    )
  end

  def school_params
    params.require(:school).permit(:name)
  end

  def set_event
    @event = Event.includes([:school, :image]).find(params[:id])
  end
end
