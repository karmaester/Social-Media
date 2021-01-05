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
    
    it 'fails to create new user when param missing' do
        visit '/users/sign_up'
        fill_in 'user_name', with: 'brian'
        click_on 'Sign up'
        expect(page).to have_content('Email')
    end

    it 'redirects to sign in when not existing user is pass' do
        visit '/users/sign_in'
        fill_in 'user_email', with: 'brian@gmail.com'
        fill_in 'user_password', with: '123456'
        click_on 'Log in'
        expect(page).to have_content('Sign in')
    end
end
