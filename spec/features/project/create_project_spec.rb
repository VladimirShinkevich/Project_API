require 'rails_helper'

feature 'Create new project' do 

	let(:project) { create(:project) }
	let(:to_do) { create(:to_do, project: project) }

	background do
		visit projects_path
    click_on 'Новая Задача'
  end
	
	scenario 'You can add project valid attributes' do 
		fill_in 'Задача', with: project.title
		fill_in 'Сделать', with: to_do.text

		click_on 'Создать'

		expect(page).to have_content project.title
		expect(page).to have_content to_do.text
	end

	scenario 'You tries to add project wiyh invalid attributes' do 
		fill_in 'Задача', with: nil
		fill_in 'Сделать', with: nil

		click_on 'Создать'

		expect(page).to have_content "To dos text can't be blank"
		expect(page).to have_content "Title can't be blank"
	end
end
