# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groups index page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, author_id: @user.id)
    sign_in @user
    visit groups_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('GROUPS')
  end

  it 'should display group name' do
    expect(page).to have_content(@group.name)
  end

  it 'should display group total operations amount' do
    expect(page).to have_content('$0')
  end

  it 'should display all links' do
    find_link @group.name
    find_link 'ADD GROUP'
  end

  it 'should redirect to operations index page when clicking group link' do
    click_link @group.name

    expect(page).to have_current_path(group_operations_path(group_id: @group.id))
  end

  it 'should redirect to new group form when clicking add group link' do
    click_link 'ADD GROUP'

    expect(page).to have_current_path(new_group_path)
  end
end
