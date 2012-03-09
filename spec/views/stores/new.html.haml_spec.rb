require 'spec_helper'

describe "stores/new" do
  before(:each) do
    assign(:store, stub_model(Store,
      :name => "MyString",
      :legal_name => "MyString",
      :rut => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stores_path, :method => "post" do
      assert_select "input#store_name", :name => "store[name]"
      assert_select "input#store_legal_name", :name => "store[legal_name]"
      assert_select "input#store_rut", :name => "store[rut]"
      assert_select "textarea#store_description", :name => "store[description]"
    end
  end
end
