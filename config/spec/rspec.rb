# RSpec
RSpec.describe MenuItem, type: :model do
    describe 'associations' do
      it { should belong_to(:category).class_name('MenuCategory') }
    end
  
    describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
    end
  end
  
  # Minitest (Shoulda)
  class MenuItemTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:category).class_name('MenuCategory')
    end
  
    context 'validations' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name).scoped_to(:category_id)
    end
  end

  RSpec.describe Post, type: :model do
    describe 'validations' do
      # Here we're using FactoryBot, but you could use anything
      subject { build(:post) }
  
      it { should validate_presence_of(:title) }
    end
  end
  
  # Minitest (Shoulda)
  class PostTest < ActiveSupport::TestCase
    context 'validations' do
      subject { build(:post) }
  
      should validate_presence_of(:title)
    end
  end

  RSpec.describe PostsController, type: :controller do
    describe 'GET #index' do
      subject { get :index }
  
      # This may work...
      it { should have_http_status(:success) }
      # ...but this will not!
      it { should permit(:title, :body).for(:post) }
    end
  end


  RSpec.describe PostsController, type: :controller do
    describe 'GET #index' do
      before { get :index }
  
      # Notice that we have to assert have_http_status on the response here...
      it { expect(response).to have_http_status(:success) }
      # ...but we do not have to provide a subject for render_template
      it { should render_template('index') }
    end
  end