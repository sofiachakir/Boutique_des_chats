module ApplicationHelper
	def bootstrap_class_for_flash(type)
	  case type
	    when 'notice' then "alert-info"
	    when 'success' then "alert-success"
	    when 'error' then "alert-danger"
	    when 'alert' then "alert-warning"
	  end
	end

	def check_if_admin
		unless user_signed_in? && current_user.is_admin
			flash[:error] = "Cette page n'est disponible que pour les administrateurs du site"
			redirect_to root_path
		end
	end
	
end
