require 'rails_helper'

describe 'User', type: :feature do
    it 'redirects to index when user sign up' do
        visit '/users/sign_up'
        fill_in 'user_name', with: 'brian'
        fill_in 'user_email', with: 'brian@gmail.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
        click_on 'Sign up'
        expect(page).to have_content('Recent posts')
    end
end
