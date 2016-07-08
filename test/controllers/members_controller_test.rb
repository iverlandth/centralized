require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { address: @member.address, cellphone: @member.cellphone, church_id: @member.church_id, date_of_birth: @member.date_of_birth, first_name: @member.first_name, last_name: @member.last_name, middle_name: @member.middle_name, status: @member.status, telephone: @member.telephone } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { address: @member.address, cellphone: @member.cellphone, church_id: @member.church_id, date_of_birth: @member.date_of_birth, first_name: @member.first_name, last_name: @member.last_name, middle_name: @member.middle_name, status: @member.status, telephone: @member.telephone } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
