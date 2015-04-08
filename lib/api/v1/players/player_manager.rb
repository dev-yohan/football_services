class Api::V1::Players::PlayerManager

  def new (player_info = {})

    json_data = {}

    begin
      player_manager = Soccer::PlayerManager.new
      app = Business::App.find(player_info[:app_id])

        if !player_manager.check_if_exists(player_info)
          if player_manager.create(player_info)
            json_data = {}
            status = 200
          else
            json_data = {error_code: 101,
            dev_message: I18n.t("players.api.error.code_101.dev_message", id: activity_id),
            friendly_message: I18n.t("players.api.error.code_101.friendly_message", id: activity_id)}
            status = 500
          end
        else
          json_data = {success: true}
          status = 204
        end
    rescue Mongoid::Errors::DocumentNotFound
         json_data = {error_code: 201,
          dev_message: I18n.t("apps.api.error.code_200.dev_message"),
          friendly_message: I18n.t("apps.api.error.code_200.friendly_message",)}
         status = 404
    end

    {json: json_data, status: status}
  end


end
