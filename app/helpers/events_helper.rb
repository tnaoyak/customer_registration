module EventsHelper
  def web_public_display_conversion(event)
    case event.web_public
    when "0" then
      "有"
    when "1" then
      "無"
    end
  end
end
