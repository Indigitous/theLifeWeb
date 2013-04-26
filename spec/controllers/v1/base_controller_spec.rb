require 'spec_helper'

describe V1::BaseController do
  describe '#set_locale' do
    controller(V1::BaseController) do
      skip_before_filter :authenticate_user!

      def localized_text
        render text: I18n.t('hello') + ' ' + I18n.t('world')
      end
    end

    before do
      routes.draw do
        get "localized_text" => "anonymous#localized_text"
      end

      I18n.backend.store_translations :en, hello: 'Hello'

      I18n.backend.store_translations :en, world: 'World'
      I18n.backend.store_translations :fr, world: 'Monde'
    end

    it 'should set default locale to English' do
      get :localized_text

      response.body.should == 'Hello World'
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        user.update_attribute(:locale, 'fr')
        sign_in user
      end

      it "should use current user's locale if set and default unknown strings to English" do
        get :localized_text

        response.body.should == 'Hello Monde'
      end
    end
  end
end
