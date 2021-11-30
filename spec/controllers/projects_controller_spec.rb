require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
	let(:project) { create(:project) }

  describe 'GET #index' do 
    let(:projects) { create_list(:project, 3) }

    before { get :index }

    it 'show list of Projects' do 
      expect(assigns(:projects)).to match_array(projects)
    end

    it 'render index vies' do 
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do 
    before { get :show, params: { id: project } }

    it 'assigns the requested project to @project ' do 
      expect(assigns(:project)).to eq project
    end

    it 'render show view' do 
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Project to @project' do
      expect(assigns(:project)).to be_a_new(Project)
    end

    it 'assigns a new ToDo to @to_do' do
      expect(assigns(:project).to_dos.first).to be_a_new(ToDo)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do 
    context 'with valid attributes' do
      it 'saves new Project to database' do 
        expect { post :create, params: { project: attributes_for(:project) } }.to change(Project, :count).by(1)
      end

      it 'redirect to show view' do 
        post :create, params: { project: attributes_for(:project) }
        expect(response).to redirect_to assigns(:project)
      end
    end

    context 'with invalid attributes' do 
      it 'does not save Project to database' do 
        expect { post :create, params: { project: attributes_for(:project, :invalid) } }.to_not change(Project, :count)
      end

      it 'render new view' do 
        post :create, params: { project: attributes_for(:project, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do 
    let!(:project) { create(:project) }

    describe 'Authenticated user' do 
      context 'with valid attributes' do 
        it 'assigns the request project to @project' do 
          patch :update, params: { id: project, project: attributes_for(:project), format: :js }
          expect(assigns(:project)).to eq project
        end

        it 'change project attributes' do 
          patch :update, params: { id: project, project: { title: 'edit title' }, format: :js }
          project.reload
          expect(project.title).to eq 'edit title'
        end

        it 'render template update' do 
          patch :update, params: { id: project, project: { title: 'edit title' }, format: :js }
          expect(response).to render_template :update
        end
      end

      context 'with invalid attributes' do
        it 'does not change project attributes' do 
          expect do 
            patch :update, params: { id: project, project: attributes_for(:project, :invalid) }, format: :js
          end.to_not change(project, :title)
        end

        it 'render update template' do 
          patch :update, params: { id: project, project: attributes_for(:project, :invalid) }, format: :js
          expect(response).to render_template :update
        end
      end
    end
  end

  describe 'DELETE #destroy' do 
    let!(:project) { create(:project) }

    it 'delete project from database' do 
      expect { delete :destroy, params: { id: project } }.to change(Project, :count).by(-1)
    end

    it 'redirect to index ' do 
      delete :destroy, params: { id: project }
      expect(response).to redirect_to projects_path
    end
  end
end
