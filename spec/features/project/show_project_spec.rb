require 'rails_helper'

feature 'Can see project' do 
  let!(:project) { create(:project, :with_to_do) }

  scenario 'View project with to_dos' do 
    visit project_path(project)

    expect(page).to have_content project.title
    expect(page.all('li').size).to eq project.to_dos.count
  end
end
