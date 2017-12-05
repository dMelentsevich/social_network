require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it { should use_before_action(:pundit_authorize) }
end
