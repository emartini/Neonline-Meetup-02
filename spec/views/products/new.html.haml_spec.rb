require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyText",
      :cost => 1,
      :price => 1,
      :store_id => 1,
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_title", :name => "product[title]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_cost", :name => "product[cost]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_store_id", :name => "product[store_id]"
      assert_select "input#product_state", :name => "product[state]"
    end
  end
end
