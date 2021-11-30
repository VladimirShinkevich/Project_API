require 'rails_helper'

feature 'You can see project' do 

	let!(:projects) { create_list(:project, 4) }

	scenario 'Can see list of projects' do 
		visit projects_path

		expect(page).to have_content 'Задачи'
		expect(projects.size).to eq Project.count
	end
end
