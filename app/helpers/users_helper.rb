module UsersHelper
  def occupation_icon
    
    case @user.profile.occupation
    
    when "Developer"
      "<i class='fa fa-code'></i>".html_safe
    when "Entrepreneur"
      "<i class='fa fa-lightbulb-o'></i>".html_safe
    when "Recruiter"
      "<i class='fa fa-search'></i>".html_safe
    end
  end
end