require "application_system_test_case"

class SubGenresTest < ApplicationSystemTestCase
  setup do
    @sub_genre = sub_genres(:one)
  end

  test "visiting the index" do
    visit sub_genres_url
    assert_selector "h1", text: "Sub genres"
  end

  test "should create sub genre" do
    visit sub_genres_url
    click_on "New sub genre"

    fill_in "Description", with: @sub_genre.description
    fill_in "Genres", with: @sub_genre.genre_id
    fill_in "Name", with: @sub_genre.name
    click_on "Create Sub genre"

    assert_text "Sub genre was successfully created"
    click_on "Back"
  end

  test "should update Sub genre" do
    visit sub_genre_url(@sub_genre)
    click_on "Edit this sub genre", match: :first

    fill_in "Description", with: @sub_genre.description
    fill_in "Genres", with: @sub_genre.genre_id
    fill_in "Name", with: @sub_genre.name
    click_on "Update Sub genre"

    assert_text "Sub genre was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub genre" do
    visit sub_genre_url(@sub_genre)
    click_on "Destroy this sub genre", match: :first

    assert_text "Sub genre was successfully destroyed"
  end
end
