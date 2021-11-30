require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:to_dos).dependent(:destroy) }

  it { should validate_presence_of :title }
    
  it { should accept_nested_attributes_for :to_dos }
end
