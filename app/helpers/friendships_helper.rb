module FriendshipsHelper
  def display_requests
    return unless current_user.id != @user.id

    current_user.friend_requests.each do |person|
      link_to user_path(person.id) do
        raw ''
      end
      link_to accept_path(user_id: person.id, friend_id: current_user.id), method: :post do
        raw '<span class="btn btn-success"> Accept </span>'
      end
      link_to reject_path(user_id: person.id, friend_id: current_user.id), method: :delete do
        raw '<span class="btn btn-danger"> Reject </span>'
      end
    end
  end
end
