class Api::V1::Players::PlayerManager

  def new (player_info = {})

    json_data = {}

    begin
      player_manager = Soccer::PlayerManager.new
      puts "PLAYER INFO #{player_info.inspect}"
      app = Business::App.find(player_info[:app_id])

        if(!player_info[:unique_id].nil? && !player_info[:first_name].nil? && !player_info[:last_name].nil?)

            if !player_manager.check_if_exists(player_info)
                if player_manager.create(player_info)
                  new_player = player_manager.retrieve_basic_player(player_info)
                  json_data = {  id: new_player.id.to_s,
                                 unique_id: new_player.unique_id,
                                              first_name: new_player.first_name,
                                              last_name: new_player.last_name,
                                              app_id: new_player.app.id.to_s}
                  status = 200
                else
                  json_data = {error_code: 101,
                  dev_message: I18n.t("players.api.error.code_101.dev_message"),
                  friendly_message: I18n.t("players.api.error.code_101.friendly_message")}
                  status = 500
                end
            else
                json_data = {error_code: 103,
                dev_message: I18n.t("players.api.error.code_103.dev_message"),
                friendly_message: I18n.t("players.api.error.code_103.friendly_message")}
                status = 403
            end
        else
            json_data = {error_code: 102,
            dev_message: I18n.t("players.api.error.code_102.dev_message"),
            friendly_message: I18n.t("players.api.error.code_102.friendly_message")}
            status = 403
        end
    rescue Mongoid::Errors::DocumentNotFound
         json_data = {error_code: 201,
          dev_message: I18n.t("apps.api.error.code_200.dev_message"),
          friendly_message: I18n.t("apps.api.error.code_200.friendly_message")}
         status = 404
    end

    {json: json_data, status: status}
  end


end
