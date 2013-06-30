class ApplicationController < ActionController::Base
  
  protect_from_forgery

  private 

    # if not Admin i.e. permission denied
    def render_403
  	  render file: "public/403", formats: :html, status: 403
    end
  
    def render_404
  	  render file: "public/404", formats: :html, status: 404
    end

    def check_if_admin
      # render_403 unless params[:admin] 
    end 

end
