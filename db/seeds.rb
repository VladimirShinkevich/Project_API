# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	projects = Project.create([
		{ title: 'Семья' },
		{ title: 'Работа'},
		{ title: 'Прочее'}
	])

	todos = ToDo.create([
		{ text: 'Купить молоко',is_completed: false, project_id: projects[0].id },
		{ text: 'Заменить масло в двигателе до 23 апреля',is_completed: false, project_id: projects[0].id },
		{ text: 'Отправить письмо бабушке',is_completed: false, project_id: projects[0].id },
		{ text: 'Заплатить за квартиру',is_completed: true, project_id: projects[0].id },
		{ text: 'Забрать обувь из ремонта',is_completed: false, project_id: projects[0].id },
		{ text: 'Позвонить заказчику',is_completed: true, project_id: projects[1].id },
		{ text: 'Отправить документы',is_completed: true, project_id: projects[1].id },
		{ text: 'Заполнить отчет',is_completed: false, project_id: projects[1].id },
		{ text: 'Позвонить другу',is_completed: false, project_id: projects[2].id },
		{ text: 'Подготовиться к поездке',is_completed: false, project_id: projects[2].id },
	])
