require 'test_helper'

class SubEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_event = sub_events(:one)
  end

  test "should get index" do
    get sub_events_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_event_url
    assert_response :success
  end

  test "should create sub_event" do
    assert_difference('SubEvent.count') do
      post sub_events_url, params: { sub_event: { description: @sub_event.description, event_id: @sub_event.event_id, name: @sub_event.name, place: @sub_event.place, sub_event_end_at: @sub_event.sub_event_end_at, sub_event_start_at: @sub_event.sub_event_start_at } }
    end

    assert_redirected_to sub_event_url(SubEvent.last)
  end

  test "should show sub_event" do
    get sub_event_url(@sub_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_event_url(@sub_event)
    assert_response :success
  end

  test "should update sub_event" do
    patch sub_event_url(@sub_event), params: { sub_event: { description: @sub_event.description, event_id: @sub_event.event_id, name: @sub_event.name, place: @sub_event.place, sub_event_end_at: @sub_event.sub_event_end_at, sub_event_start_at: @sub_event.sub_event_start_at } }
    assert_redirected_to sub_event_url(@sub_event)
  end

  test "should destroy sub_event" do
    assert_difference('SubEvent.count', -1) do
      delete sub_event_url(@sub_event)
    end

    assert_redirected_to sub_events_url
  end
end
