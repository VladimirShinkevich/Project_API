require 'rails_helper'

RSpec.describe ToDosController, type: :controller do
  let!(:project) { create(:project) }
  let!(:to_do) { create(:to_do, project: project) }

  describe 'DELETE #destroy' do 
    it 'delete to_do from project' do
      expect { delete :destroy, params: { id: to_do }, format: :js }.to change(ToDo, :count).by(-1)
    end
  end
end
