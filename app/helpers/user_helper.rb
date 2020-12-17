module UserHelper

    def add_friend(user)
        if current_user.id == user.id || current_user.friend?(user)
          nil
        else
          link_to 'Add Friend',
          friendships_path(friendship: { user_id: current_user, friend_id: user.id, confirmed: false }),
          method: :post, class: 'btn btn-primary'
        end
      end

end
