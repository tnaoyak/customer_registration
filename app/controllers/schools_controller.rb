class SchoolsController < ApplicationController
  def index
    @event = Event.includes([:school, :image]).where(school_id:)
  end
end
