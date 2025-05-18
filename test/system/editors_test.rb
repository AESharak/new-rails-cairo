require "application_system_test_case"

class EditorsTest < ApplicationSystemTestCase
  setup do
    @editor = editors(:one)
  end

  test "visiting the index" do
    visit editors_url
    assert_selector "h1", text: "Editors"
  end

  test "should create editor" do
    visit editors_url
    click_on "New editor"

    fill_in "Email", with: @editor.email
    fill_in "Name", with: @editor.name
    click_on "Create Editor"

    assert_text "Editor was successfully created"
    click_on "Back"
  end

  test "should update Editor" do
    visit editor_url(@editor)
    click_on "Edit this editor", match: :first

    fill_in "Email", with: @editor.email
    fill_in "Name", with: @editor.name
    click_on "Update Editor"

    assert_text "Editor was successfully updated"
    click_on "Back"
  end

  test "should destroy Editor" do
    visit editor_url(@editor)
    click_on "Destroy this editor", match: :first

    assert_text "Editor was successfully destroyed"
  end
end
