require 'spec_helper'

describe 'v1/my_requests' do
  let(:user) { create(:user) }
  let(:invited_user) { create(:user) }
  let(:authentication_token) { invited_user.authentication_token }
  let(:group) { create(:group, owner: user) }

  let!(:invite_request) do
    create(:invite_request, sender: user, group: group, email: invited_user.email)
  end

  subject { json_response_body }

  before do
    get '/v1/my_requests', authentication_token: authentication_token
  end

  describe "get invited user invite requests" do
    it { should be_a_kind_of Array }

    its(:first) { should be_a_my_invite_request_representation(invite_request) }

    context 'when invite request was accepted' do
      let!(:invite_request) do
        create :invite_request,
          :accepted,
          sender: user,
          group: group,
          email: invited_user.email
      end

      it { should be_empty }
    end

    context 'when invite request was rejected' do
      let!(:invite_request) do
        create :invite_request,
          :rejected,
          sender: user,
          group: group,
          email: invited_user.email
      end

      it { should be_empty }
    end
  end

  describe "get invited user request membership requests" do
    let!(:invite_request) do
      create :membership_request,
        sender: invited_user,
        group: group,
        email: user.email
    end

    it { should be_empty }

    context 'when invite request was accepted' do
      let!(:invite_request) do
        create :membership_request,
          :accepted,
          sender: invited_user,
          group: group,
          email: user.email
      end

      its(:first) { should be_a_my_invite_request_representation(invite_request) }
    end

    context 'when invite request was rejected' do
      let!(:invite_request) do
        create :membership_request,
          :rejected,
          sender: invited_user,
          group: group,
          email: user.email
      end

      its(:first) { should be_a_my_invite_request_representation(invite_request) }
    end
  end

  describe "get group leader's invite requests" do
    let(:authentication_token) { user.authentication_token }

    context 'when invite request is delivered' do
      it { should be_empty }
    end

    context 'when invite request was accepted' do
      let!(:invite_request) do
        create :invite_request,
          :accepted,
          sender: user,
          group: group,
          email: invited_user.email
      end

      its(:first) { should be_a_my_invite_request_representation(invite_request) }
    end

    context 'when invite request was rejected' do
      let!(:invite_request) do
        create :invite_request,
          :rejected,
          sender: user,
          group: group,
          email: invited_user.email
      end

      its(:first) { should be_a_my_invite_request_representation(invite_request) }
    end
  end

  describe "get group leader's request membership requests" do
    let(:authentication_token) { user.authentication_token }

    let!(:invite_request) do
      create :membership_request,
        sender: invited_user,
        group: group,
        email: user.email
    end

    its(:first) { should be_a_my_invite_request_representation(invite_request) }

    context 'when invite request was accepted' do
      let!(:invite_request) do
        create :membership_request,
          :accepted,
          sender: invited_user,
          group: group,
          email: user.email
      end

      it { should be_empty }
    end

    context 'when invite request was rejected' do
      let!(:invite_request) do
        create :membership_request,
          :rejected,
          sender: invited_user,
          group: group,
          email: user.email
      end

      it { should be_empty }
    end
  end
end
