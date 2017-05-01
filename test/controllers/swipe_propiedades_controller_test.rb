require 'test_helper'

class SwipePropiedadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get swipe_propiedades_index_url
    assert_response :success
  end

end
