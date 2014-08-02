require 'spec_helper'

feature 'Visit Home' do
  scenario 'The page is shown properly' do
    visit '/'
    expect(page).to have_title('Pairoulette')
  end
end
