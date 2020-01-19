require 'rails_helper'
RSpec.describe JobInformation, type: :model do

    context "求人情報が正しく保存される" do
        before do
            @job_information = JobInformation.new
            user = User.create(first_name: "Hiroyuki", last_name: "Uno", first_name_kana: "ヒロユキ", last_name_kana: "ウノ", email: "aaa@aaa", password: "aaaaaa", password_confirmation: "aaaaaa", phone_number: "08035559597", gender: "男性")
            @job_information.user_id = user.id
            @job_information.title = "人事総務＜◎人事のキャリアを積める◎恵比寿勤務◎転勤なし＞"
            @job_information.summary = "設立から10年の節目を迎えるシーラ。設立当時から、自分達が欲しいマンションを創る。の理念を胸に、自社ブランドマンションの開発にこだわり続けてきました。2020年以降も順調に開発予定が立っており、増収増益を続ける見込みです。"
            @job_information.company = "株式会社シーラ"
            @job_information.genre = "人事"
            @job_information.area = "埼玉"
            @job_information.income = 450
            @job_information.detail = "採用・教育・社内イベント企画などの人事総務業務【具体的には】人事総務全般の、企画から提案、運用まで全てを手がけることができます。未経験の仕事でも先輩がついているので安心してください。また、得意なことを活かして役割分担することができます。"
        end
        it "全て入力してあるので保存される" do
            expect{@job_information.save}.to change { JobInformation.count }.by(1)
        end
    end


    context "求人情報が正しく保存されない" do
        before do
            @job_information = JobInformation.new
            user = User.create(first_name: "Hiroyuki", last_name: "Uno", first_name_kana: "ヒロユキ", last_name_kana: "ウノ", email: "aaa@aaa", password: "aaaaaa", password_confirmation: "aaaaaa", phone_number: "08035559597", gender: "男性")
            @job_information.user_id = user.id
            @job_information.title = "人事総務＜◎人事のキャリアを積める◎恵比寿勤務◎転勤なし＞"
            @job_information.summary = "設立から10年の節目を迎えるシーラ。設立当時から、自分達が欲しいマンションを創る。の理念を胸に、自社ブランドマンションの開発にこだわり続けてきました。2020年以降も順調に開発予定が立っており、増収増益を続ける見込みです。"
            @job_information.company = "株式会社シーラ"
            @job_information.genre = "人事"
            @job_information.area = "埼玉"
            @job_information.income = 450
            @job_information.detail = "採用・教育・社内イベント企画などの人事総務業務"
        end
        it "detailが50文字以下のため保存されない" do
            expect(@job_information).to be_invalid
            expect(@job_information.errors.messages[:detail]).to include("は50文字以上で入力してください")
        end
    end


end