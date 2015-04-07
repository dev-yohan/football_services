class Soccer::PlayerManager

  def create (player_info = {})

    app = Business::App.find(player_info[:app_id])

    player = Soccer::Player.new(unique_id: player_info[:unique_id],
                                first_name: player_info[:first_name],
                                last_name: player_info[:last_name],
                                app: app)

    player.save

  end


  def check_if_exists (player_info)
    player = Soccer::Player.where(unique_id: player_info[:unique_id], app_id: player_info[:app_id]).first
    if !player.nil?
      true
    else
      false
    end
  end

end
