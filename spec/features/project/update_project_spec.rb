require 'rails_helper'

feature 'Can update project' do 

	let!(:project) { create(:project) }

	background do 
		visit project_path(project)
		click_on 'Редактировать'
	end
	
	scenario 'can update with valid attributes', js: true do 

		fill_in 'Задача', with: 'update project'

		click_on 'Сохранить'

		expect(page).to_not have_content project.title
		expect(page).to have_content 'update project'
	end

	scenario 'tries to update with invalid attributes', js: true do 
		fill_in 'Задача', with: nil

		click_on 'Сохранить'

		expect(page).to have_content "Title can't be blank"
	end
end
