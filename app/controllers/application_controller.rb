class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required

    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    #初期表示の新規登録ボタンだけパスが通る
    def login_required
      if (controller_path != 'users' && action_name != 'new')
        redirect_to login_path unless current_user
      end
    end
end
