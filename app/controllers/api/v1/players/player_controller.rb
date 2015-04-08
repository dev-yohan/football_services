class Api::V1::Players::PlayerController < Api::V1::ApiController
  before_action :authenticate

  def new
    player_manager = Api::V1::Players::PlayerManager.new
    render player_manager.new({unique_id: params[:unique_id],
                                first_name: params[:first_name],
                                last_name: params[:last_name],
                                app_id: params[:app_id]})
  end

end
