module ApplicationHelper
    def format_date_for_human(date_hash)
      year = date_hash[1]
      month = date_hash[2]
      day = date_hash[3]
      formatted_date = Date.new(year, month, day).strftime('%B %e, %Y')
      # Adjust the format according to your preferences
      formatted_date
    end
end
