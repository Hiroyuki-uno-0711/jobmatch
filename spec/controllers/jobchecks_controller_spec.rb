require 'rails_helper'
RSpec.describe JobchecksController, type: :controller do


    describe '転職診断結果「MR」ページ' do
      context "「MR」ページが正しく表示されるか" do
        before do
        @user = User.create(first_name: "Hiroyuki", last_name: "Uno", first_name_kana: "ヒロユキ", last_name_kana: "ウノ", email: "aaa@aaa", password: "aaaaaa", password_confirmation: "aaaaaa", phone_number: "08035559597", gender: "男性", age: 29, career: "物流倉庫管理", career_age: 3, user_status: "一般ユーザー" )
        sign_in @user
        allow_any_instance_of(JobchecksController)
          .to receive(:current_user)
          .and_return(@user)

          get :mr_sales
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        render_views
        it 'タイトルに「MR」が含まれている' do
            expect(response.body).to include("MR")
        end

      end
    end


    describe '転職診断結果「秘書」ページ' do
      context "「秘書」ページが正しく表示されるか" do
        before do
        @user = User.create(first_name: "Hiroyuki", last_name: "Uno", first_name_kana: "ヒロユキ", last_name_kana: "ウノ", email: "aaa@aaa", password: "aaaaaa", password_confirmation: "aaaaaa", phone_number: "08035559597", gender: "男性", age: 21, career: "商品サービス企画", career_age: 7, user_status: "一般ユーザー" )
        sign_in @user
        allow_any_instance_of(JobchecksController)
          .to receive(:current_user)
          .and_return(@user)

          get :secretary
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        render_views
        it 'タイトルに「秘書」が含まれている' do
            expect(response.body).to include("秘書")
        end

      end
    end

end