class JobchecksController < ApplicationController
  before_action :authenticate_user!

  # キャリアアドバイザーは全ページに遷移できない設定
  before_action :career_advisor

  include CommonActions
  # 一般ユーザーは、「年齢」、「経験職種」、「経験年数」を入力していないと全ページに遷移できない設定
  before_action :user_blank



  # (メーカー商社営業)ページを表示させる
  def manufacturer_sales

    manufacturer_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.9
     when '無形営業'
       career = 0.75
     when '商品サービス企画'
       career = 0.63
     when '物流倉庫管理'
       career = 0.65
     when '一般事務'
       career = 0.35
     when '人事', '経理', '総務', 'システムエンジニア'
       career = 0.4
     when '販売サービス'
       career = 0.5
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    manufacturer_sales = career * age * career_age * 100
    @manufacturer_sales = manufacturer_sales


    case current_user.career
     when '有形営業'
      @memo = '志望する業界によって就職難易度は変わりますが、これまで有形物を扱っていた点においては、比較的経験の親和性はあり、転職成功率は高いと思われます。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。あまり選り好みすると転職が長引く可能性があるため注意が必要です。'

     when '無形営業'
      @memo = '経験業界は異なりますが、これまでの顧客折衝経験を活かし、比較的転職はしやすい可能性が高いです。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。あまり選り好みすると転職が長引く可能性があるため注意が必要です。'

     when '商品サービス企画'
      @memo = 'これまで企画していた商品やサービスのジャンルと、志望する業界に親和性があれば、営業職への転職も可能性は広がります。ただ顧客折衝経験が弱いと完全未経験としてみられるため、ハードルはやや高いです。また大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'

     when '物流倉庫管理'
      @memo = '顧客折衝経験が全くない場合は完全未経験としてみられるためハードルは高いですが、物流業務だけでなく取引先との折衝経験があれば、加点要素となります。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'

     when '一般事務', '経理', '総務', 'システムエンジニア'
      @memo = '28歳までであれば、コミュニケーション力や人当りでカバーできる可能性はありますが、顧客折衝経験が全くない場合は完全未経験としてみられるため、ハードルは高いです。出身業界に親和性があれば、知識面で加点ポイントにはなります。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'

     when '人事'
      @memo = '採用業務などで数字を追っていた経験があれば、営業でも活かせると判断され、転職の可能性は広がります。とはいえ、顧客折衝経験が全くない場合は完全未経験としてみられるため、ハードルは高いです。また大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'

     when '販売サービス'
      @memo = '顧客折衝経験を活かし、転職できる可能性はあります。ただこれまでの経験が個人客への折衝が主なため、法人折衝経験を強く求められる企業への転職は難しいです。また大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'
    end
  end



  # (IT営業)ページを表示させる
  def it_sales

    it_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.75
     when '無形営業'
       career = 0.8
     when '商品サービス企画', '販売サービス'
       career = 0.55
     when '物流倉庫管理'
       career = 0.5
     when '一般事務'
       career = 0.42
     when '人事', '経理', '総務'
       career = 0.45
     when 'システムエンジニア'
       career = 0.63
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    it_sales = career * age * career_age * 100
    @it_sales = it_sales


    case current_user.career
     when '有形営業'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。顧客折衝という点では、比較的経験が活かしやすいですが、スピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '無形営業'
      @memo = '形のない商品（サービス）を売ってきた経験は、IT営業との親和性があり、転職には有利な武器となります。またIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。無論、企業によって求める人物像や経験は異なるため、面接対策は怠らないよう注意しましょう。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。これまで企画していた商品やサービスのジャンルがIT業界に親和性があれば、転職の可能性は広がります。ただ顧客折衝経験が弱いと完全未経験としてみられるため、ハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '人事'
      @memo = '採用業務などで数字を追っていた経験があれば、営業でも活かせると判断され、転職の可能性は広がります。ただIT業界は、スピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。顧客折衝経験が全くない場合は完全未経験としてみられるため、総じてハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when 'システムエンジニア'
      @memo = 'これまで経験したIT知見が志望する業界の商材と親和性があれば、転職成功率は上がります。ただ顧客折衝経験が全くない場合は未経験としてみられるため、総じてハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '販売サービス'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。これまでの顧客折衝経験を活かし、転職できる可能性はありますが、スピード感に順応できるかという点を強くみられることと、法人営業経験がないという点で、総じてハードルが高い職種です。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'
    end
  end



  # （不動産営業）ページを表示させる
  def real_estate_sales

    real_estate_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.95
     when '無形営業'
       career = 0.93
     when '商品サービス企画', '物流倉庫管理'
       career = 0.7
     when '一般事務', '人事', '経理', '総務', 'システムエンジニア'
       career = 0.65
     when '販売サービス'
       career = 0.8
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    real_estate_sales = career * age * career_age * 100
    @real_estate_sales = real_estate_sales


    case current_user.career
     when '有形営業', '無形営業'
      @memo = '不動産営業には、長期的な視点や、高額な予算を取り扱う技量、課題解決力が求められます。また前のめりで押しの強い人柄が好まれる傾向にあります。顧客折衝経験が活きるため、賃貸などの個人営業であればさほどハードルは高くありませんが、大手ゼネコンや住宅メーカーなどの企業は高額商品を売ってきた経験値を強くみるため、間口が広いとは言えません。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = '不動産営業には、長期的な視点や、高額な予算を取り扱う技量、課題解決力が求められます。また前のめりで押しの強い人柄が好まれる傾向にあります。他の営業職と同じく、顧客折衝経験が少ない場合完全未経験としてみられるため、ハードルはやや高いです。ただ1から営業力を身に着けたい意欲があれば、未経験歓迎求人は多い職種であるため、チャレンジできる余地はある職種となります。その際は飛込みなどの新規開拓からスタートする覚悟が必要です。'

    end
  end



  # （MR）ページを表示させる
  def mr_sales

    mr_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.7
     when '無形営業'
       career = 0.55
     when '商品サービス企画'
       career = 0.5
     when '物流倉庫管理', '一般事務'
       career = 0.25
     when '人事', '経理', '総務'
       career = 0.3
     when 'システムエンジニア'
       career = 0.28
     when '販売サービス'
       career = 0.45
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    mr_sales = career * age * career_age * 100
    @mr_sales = mr_sales


    case current_user.career
     when '有形営業', '無形営業'
      @memo = 'MRは、医療技術の発達により今後も需要が高まっていく職種といえます。ただ専門的知識を問われる職種であり、地頭や高い提案能力を求められるため、転職のハードルは非常に高い職種といえるでしょう。これまでの顧客折衝経験が活きる要素はありますが、高度な専門知識が問われるMRよりは、医療機器営業などでステップを積んでから転職することが現実的な選択肢となります。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = 'MRは、医療技術の発達により今後も需要が高まっていく職種といえます。ただ専門的知識を問われる職種であり、地頭や高い提案能力を求められるため、転職のハードルは非常に高い職種といえるでしょう。高度な専門知識が問われるMRよりは、医療機器営業などでステップを積んでから転職することが現実的な選択肢となります。医療機器営業で未経験OK求人は多いとはいえないため、選り好みはしないよう注意しましょう。'

    end
  end



  # （人材営業）ページを表示させる
  def human_resources_sales

    human_resources_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.85
     when '無形営業'
       career = 0.9
     when '商品サービス企画'
       career = 0.65
     when '物流倉庫管理', '総務'
       career = 0.58
     when '一般事務'
       career = 0.52
     when '人事'
       career = 0.7
     when '経理'
       career = 0.55
     when 'システムエンジニア'
       career = 0.48
     when '販売サービス'
       career = 0.65
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    human_resources_sales = career * age * career_age * 100
    @human_resources_sales = human_resources_sales


    case current_user.career
     when '有形営業'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。顧客折衝という点では、比較的経験が活かしやすいですが、論理的な思考やスピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。ただ人手不足が追い風となり、業界自体は成長産業であるため、求人数は多い傾向にあります。'

     when '無形営業'
      @memo = '形のない商品（サービス）を売ってきた経験は、人材営業との親和性があり、転職には有利な武器となります。また業界自体は成長産業であり、求人数は多い傾向にあるため、選べる企業の選択肢は広いでしょう。ただ人材営業は、高いコミュニケーション能力とスピード感が求められ、また企業によって求める人物像や経験は異なるため、面接対策は怠らないよう注意しましょう。'

     when '商品サービス企画'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。他の営業職と同じく、顧客折衝経験が少ない場合完全未経験としてみられるため、ハードルはやや高いです。ただ人手不足が追い風となり、業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'

     when '物流倉庫管理'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。顧客折衝経験が全くない場合は完全未経験としてみられるため、ハードルは高いです。ただ物流業務だけでなく取引先との折衝経験があれば、加点要素となります。また人手不足が追い風となり、人材業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'

     when '一般事務', '経理', '総務'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。28歳までであれば、コミュニケーション力や人当りでカバーできる可能性はありますが、顧客折衝経験が全くない場合は完全未経験としてみられるため、ハードルは高いです。ただ人手不足が追い風となり、人材業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'

     when '人事'
      @memo = '採用業務の経験があれば、活かせる知見も多く企業から求められるケースが多いです。ただ顧客折衝経験が全くない場合は完全未経験としてみられるため、ハードルは決して低くはありません。人材営業は、高いコミュニケーション能力とスピード感が求められ、また企業によって求める人物像や経験は異なるため、面接対策は怠らないよう注意しましょう。人材業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'

     when 'システムエンジニア'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。無形業界という点で親和性はありますが、顧客折衝経験が全くない場合は未経験としてみられるため、総じてハードルは高いです。ただ人手不足が追い風となり、人材業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'

     when '販売サービス'
      @memo = '人材営業は、高いコミュニケーション能力とスピード感が求められます。これまでの顧客折衝経験を活かし、転職できる可能性はありますが、法人営業のハードルは高い傾向にあります。キャリアアドバイザーなどの個人向け営業からのスタートが狙い目となります。人材業界自体は成長産業であるため、未経験OKの求人数は多い傾向にあります。'
    end
  end



  # （Web広告営業）ページを表示させる
  def webad_sales

    webad_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.8
     when '無形営業'
       career = 0.85
     when '商品サービス企画'
       career = 0.75
     when '物流倉庫管理'
       career = 0.55
     when '一般事務'
       career = 0.48
     when '人事', '経理', '総務','システムエンジニア'
       career = 0.5
     when '販売サービス'
       career = 0.58
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    webad_sales = career * age * career_age * 100
    @webad_sales = webad_sales


    case current_user.career
     when '有形営業'
      @memo = 'Web広告業界は情報の移り変わりが激しいため、多様な変化に順応できるポテンシャルがあるかという点を重視されます。顧客折衝という点では、比較的経験が活かしやすいですが、論理的な思考やスピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。ただSNSを活用した広告やスマホの普及によるモバイル広告などの需要が増し、近年求人は増加傾向にあります。'

     when '無形営業'
      @memo = 'Web広告業界は情報の移り変わりが激しいため、多様な変化に順応できるポテンシャルがあるかという点を重視されます。無形商材を売っていたという点では、比較的経験が活かしやすいですが、論理的な思考やスピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。ただSNSを活用した広告やスマホの普及によるモバイル広告などの需要が増し、近年求人は増加傾向にあります。'

     when '商品サービス企画'
      @memo = 'Web広告業界は情報の移り変わりが激しいため、多様な変化に順応できるポテンシャルがあるかという点を重視されます。他の営業職と同じく、顧客折衝経験が少ない場合完全未経験としてみられますが、自社サービスの販促経験があればプラスポイントになります。ハードルはやや高いですが、Webの知見が少しでもあれば親和性はある職種です。とはいえハードルはやや高いため、Webメディアの営業からスタートするという選択肢も視野に入れると良いでしょう。'

     when '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = 'Web広告業界は情報の移り変わりが激しいため、多様な変化に順応できるポテンシャルがあるかという点を重視されます。他の営業職と同じく、顧客折衝経験が少ない場合完全未経験としてみられるため、ハードルはやや高いです。Webメディアの営業であれば未経験OKの求人が多いため、Web広告へのステップアップとして活用するのは手です。'
    end
  end



  # （商品サービス企画）ページを表示させる
  def service_planning

    service_planning = 0

    case current_user.career
     when '有形営業', '無形営業'
       career = 0.4
     when '商品サービス企画'
       career = 0.8
     when '物流倉庫管理', '一般事務'
       career = 0.2
     when '人事', '経理', '総務'
       career = 0.25
     when 'システムエンジニア'
       career = 0.3
     when '販売サービス'
       career = 0.32
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    service_planning = career * age * career_age * 100
    @service_planning = service_planning


    case current_user.career
     when '有形営業', '無形営業', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = '商品サービス企画担当は、ユーザーのニーズが多様化していることを背景に、きめ細かいマーケティング力が求められます。求められるスキルの専門性が高い上に、募集人員も1名枠の求人がほとんどであるため、極めて狭き門となります。ネット広告の市場が活発しているため、Web広告代理店やリサーチ会社などで経験を積んだ後、ステップアップとして転職するのは1つの手です。'

     when '商品サービス企画'
      @memo = '商品サービス企画担当は、ユーザーのニーズが多様化していることを背景に、きめ細かいマーケティング力が求められます。これまで経験した業界や、取り扱っていた商品に親和性があれば、経験を買ってもらいやすい職種ですが、昨今ネット広告の市場が活発している影響から、事業会社の商品サービス企画担当出身者よりも、Web広告の知見がある代理店出身者を採用する傾向も多くあります。'
    end
  end



  # （事務）ページを表示させる
  def office_work

    office_work = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画'
       career = 0.45
     when '物流倉庫管理', '販売サービス'
       career = 0.4
     when '一般事務'
       career = 0.7
     when '人事', '総務'
       career = 0.55
     when '経理'
       career = 0.63
     when 'システムエンジニア'
       career = 0.58
     when '販売サービス'
       career = 0.4
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    office_work = career * age * career_age * 100
    @office_work = office_work


    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '総務', '人事', '販売サービス'
      @memo = '一般事務アシスタントの仕事は多様ですが、多くの職場で担当しているのは、電話やメールへの対応、来客応対、文書管理、備品管理、資料作成、データ集計などです。PCスキルの経験が豊富であればアピールポイントになりますが、事務職員は派遣で補う企業が多く、かつ求人枠が1名のケースがほとんであるため、正社員で事務職を目指すのは非常に難関です。契約社員スタートなども視野に入れ、多くの求人にエントリーしていくことが必須となるでしょう。'

     when '一般事務'
      @memo = '一般事務アシスタントの仕事は多様ですが、多くの職場で担当しているのは、電話やメールへの対応、来客応対、文書管理、備品管理、資料作成、データ集計などです。これまでの事務職をフルに活かせる仕事であれば転職成功率は上がりますが、事務職は女性からの人気が高くライバルが多い求人でもあるため、契約社員スタートなども視野に入れ、多くの求人にエントリーしていくことが必須となるでしょう。また事務職員は派遣で補う企業が多く、かつ求人枠が1名のポジションがほとんであるため、正社員で事務職を目指すのは非常に難関です。'

     when '経理'
      @memo = '一般事務アシスタントの仕事は多様ですが、多くの職場で担当しているのは、電話やメールへの対応、来客応対、文書管理、備品管理、資料作成、データ集計などです。経理で培ったPCスキルはアピールポイントとなりますが、事務職は女性からの人気が高くライバルが多い求人でもあるため、契約社員スタートなども視野に入れ、多くの求人にエントリーしていくことが必須となるでしょう。また事務職員は派遣で補う企業が多く、かつ求人枠が1名のポジションがほとんであるため、正社員で事務職を目指すのは非常に難関です。'

     when 'システムエンジニア'
      @memo = '一般事務アシスタントの仕事は多様ですが、多くの職場で担当しているのは、電話やメールへの対応、来客応対、文書管理、備品管理、資料作成、データ集計などです。システムエンジニアで培ったPCスキルはアピールポイントとなりますが、事務職は女性からの人気が高くライバルが多い求人でもあるため、契約社員スタートなども視野に入れ、多くの求人にエントリーしていくことが必須となるでしょう。また事務職員は派遣で補う企業が多く、かつ求人枠が1名のポジションがほとんであるため、正社員で事務職を目指すのは非常に難関です。'
    end
  end



  # （秘書）ページを表示させる
  def secretary

    secretary = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '人事', '経理', '総務', 'システムエンジニア', '販売サービス'
       career = 0.35
     when '一般事務'
       career = 0.4
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    secretary = career * age * career_age * 100
    @secretary = secretary

    @memo = '秘書は、社長や役員などの業務が円滑に進むようにサポートする仕事であるため、細やかな業務をマルチでこなす技量が求められる仕事です。専門スキルは問われないものの、高いコミュニケーション力や処理能力を求められ、かつ求人枠が1名のポジションがほとんであるため、転職難易度は高い職種です。応募先の企業の社長や役員と相性が合うかという曖昧な要素も判断材料となるため、多くの求人にエントリーしていくことは必須となるでしょう。'

  end



  # （人事）ページを表示させる
  def human_resources

    human_resources = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '販売サービス'
       career = 0.3
     when '一般事務'
       career = 0.23
     when '人事'
       career = 0.8
     when '経理', 'システムエンジニア'
       career = 0.33
     when '総務'
       career = 0.37
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    human_resources = career * age * career_age * 100
    @human_resources = human_resources


    case current_user.career
     when '有形営業'
      @memo = '人事の仕事は、人材の採用、配置、教育、評価設計、給与や社会保険の労務業務など、企業の人材にまつわる幅広い領域にわたりますが、未経験での転職は採用業務からスタートするケースが多いです。採用業務などで数字を追う仕事もあるため、これまでの営業経験が活かせる要素もありますが、採用枠が基本的に1名、かつ社内を巻き込む高いコミュニケーション力や経営視点を持った人材が求められるため、転職難易度は高い職種といえます。一般的に未経験で人事に転職する場合、まずは人材営業などでステップを積んでから転職することがベターとされています。'

     when '無形営業'
      @memo = '人事の仕事は、人材の採用、配置、教育、評価設計、給与や社会保険の労務業務など、企業の人材にまつわる幅広い領域にわたりますが、未経験での転職は採用業務からスタートするケースが多いです。人材業界などで人事との折衝経験があれば大きなプラスポイントになりますが、採用枠が基本的に1名、かつ社内を巻き込む高いコミュニケーション力や経営視点を持った人材が求められるため、転職難易度は高い職種といえます。'

     when '物流倉庫管理', '商品サービス企画', '一般事務', '経理', '総務', 'システムエンジニア', '販売サービス'
      @memo = '人事の仕事は、人材の採用、配置、教育、評価設計、給与や社会保険の労務業務など、企業の人材にまつわる幅広い領域にわたりますが、未経験での転職は採用業務からスタートするケースが多いです。採用枠が1名であることが多く、社内を巻き込む高いコミュニケーション力や経営視点を持った人材が求められるため、転職難易度は高い職種といえます。一般的に未経験で人事に転職する場合、人材営業などでステップを積んでから転職することがベターとされています。'

     when '人事'
      @memo = '人事の仕事は、人材の採用、配置、教育、評価設計、給与や社会保険の労務業務など、企業の人材にまつわる幅広い領域にわたります。業界は違えど採用や労務は他企業にも輸入しやすいスキルであるため、比較的転職はしやすい職種となります。ただ、昨今人手不足の影響から企業の採用業務はダイレクトリクルーティングが主流となっているため、受け身の採用のみの経験はあまり好まれない傾向にあります。採用スタイル、スピード感、規模感が近しい企業を選定することが重要となってくるでしょう。'
    end
  end



  # （経理）ページを表示させる
  def accounting

    accounting = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '販売サービス'
       career = 0.3
     when '一般事務', '人事', '総務', 'システムエンジニア'
       career = 0.37
     when '経理'
       career = 0.8
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    accounting = career * age * career_age * 100
    @accounting = accounting


    case current_user.career
     when '有形営業', '無形営業', '物流倉庫管理', '一般事務', '商品サービス企画', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = '経理は会社における”お金”に関わる仕事です。決算業務をメインに入出金管理など、会社のキャッシュフローに関する業務を幅広く担当します。近年は会計システムのフロー改善を行っている企業が増えている影響から経理職の求人は多い状況です。ただ未経験で入社する場合は、最低でも簿記2級の資格が必要なケースや、会計周りの業務経験が必須だったりと、前提条件が非常に厳しい職種です。会計事務所の経理職は、事業会社に比べ比較的ハードルは低い傾向にあるため、その経験からステップアップするという手段もあります。'

     when '経理'
      @memo = '経理は会社における”お金”に関わる仕事です。決算業務をメインに入出金管理など、会社のキャッシュフローに関する業務を幅広く担当します。近年は会計システムのフロー改善を行っている企業が増えている影響から経理職の求人は多い状況です。これまでと同等の規模感の企業であれば、経理業務の幅も比較的比例するため、ある程度は選り好みができるでしょう。上場企業への転職の際は上場基準での決算経験が必要だったり、連結や年次決算経験などのコアスキルも当然みられるため、求人票の必須スキル項目は必ずチェックしましょう。'
    end
  end



  # （総務）ページを表示させる
  def general_affairs

    general_affairs = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '一般事務', '販売サービス'
       career = 0.3
     when '経理', "システムエンジニア"
       career = 0.33
     when '人事'
       career = 0.37
     when '総務'
       career = 0.8
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    general_affairs = career * age * career_age * 100
    @general_affairs = general_affairs


    case current_user.career
     when '有形営業', '無形営業', '物流倉庫管理', '一般事務', '商品サービス企画', '経理', '人事', 'システムエンジニア', '販売サービス'
      @memo = '総務は、企業活動および社員の就労環境を物心両面から支える仕事です。具体的には、オフィスや什器、調度の手配、社内規則整備、社内文書管理、株式関係業務、福利厚生制度の整備、職場環境整備、業務改善の推進、社内プロジェクト推進など様々です。総務は企業内情に詳しい人材が重宝されやすいため、内部から人材を採用するケースが多く、中途募集はあまり多くない現状です。専門スキルも問われるため総じて転職ハードルは高い職種となります。'

     when '総務'
      @memo = '総務は、企業活動および社員の就労環境を物心両面から支える仕事です。企業を選り好みしなければ比較的転職はしやすいですが、総務は企業内情に詳しい人材が重宝されやすいため、内部から人材を採用するケースが多く、中途募集はあまり多くない現状です。最近では、コンプライアンス体制の構築に向けたマニュアル整備や、マイナンバー導入に際しての個人情報漏えい防止策の制定などが、企業経営の根幹に関わるため、それらの知見など転職において大きな武器となるでしょう。'
    end
  end



  # (Webエンジニア)ページを表示させる
  def system_engineer

    system_engineer = 0

    case current_user.career
     when '有形営業', '無形営業', '商品サービス企画', '物流倉庫管理', '一般事務', '販売サービス', '経理', '人事', '総務'
       career = 0.6
     when "システムエンジニア"
       career = 0.9
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    system_engineer = career * age * career_age * 100
    @system_engineer = system_engineer


    case current_user.career
     when '有形営業', '無形営業', '物流倉庫管理', '一般事務', '商品サービス企画', '経理', '人事', '総務', '販売サービス'
      @memo = 'Webエンジニアは、ITシステムの中でもWebの知識・スキルを持つエンジニアです。事業会社の商材や社内システムがWeb化している影響からサービスのニーズは高く、それに伴い多くの人材を確保する動きが企業間であるため、求人数は比較的多い職種です。ただ未経験での転職の場合、専門知識を問われる職種のため、ある程度のITリテラシーを備えておく必要があります。また年齢層が若い傾向にある職種のため、20代を超えると未経験での入社は難しくなります。'

     when 'システムエンジニア'
      @memo = 'Webエンジニアは、ITシステムの中でもWebの知識・スキルを持つエンジニアです。事業会社の商材や社内システムがWeb化している影響からサービスのニーズは高く、それに伴い多くの人材を確保する動きが企業間であるため、求人数は比較的多い職種です。これまでのスキルがフルに活かせる環境であれば引く手あまたですが、事業会社の社内SEや、SEO対策やWebマーケティングの知見も持った人材を求める企業などはハードルがやや高めです。'
    end
  end



  # （販売サービス）ページを表示させる
  def sales_staff

    sales_staff = 0

    case current_user.career
     when '有形営業', '無形営業'
       career = 0.88
     when "システムエンジニア", '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '人事', '総務'
       career = 0.78
     when '販売サービス'
       career = 0.95
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    sales_staff = career * age * career_age * 100
    @sales_staff = sales_staff


    case current_user.career
     when '有形営業', '無形営業'
      @memo = '販売サービスの仕事は多岐にわたりますが、基本的には商品を取り扱う実店舗で、対面での販売と接客をする仕事です。対人スキルが必須となる職種ですが、入社時に高い専門知識を必要とされるケースは少ないため、これまでの営業で培ったコミュニケーション力は大きな武器になるでしょう。ただ近年は外国人環境客に向けたサービスを取り入れている企業も増えており、英語力が問われる求人などもあるため、コミュニケーション力にプラスアルファの武器を備えておくと、より合格率は高まるでしょう。'

     when  '物流倉庫管理', '一般事務', '商品サービス企画', '経理', '人事', '総務', 'システムエンジニア'
      @memo = '販売サービスの仕事は多岐にわたりますが、基本的には商品を取り扱う実店舗で、対面での販売と接客をする仕事です。対人スキルは必須となりますが、入社時に高い専門知識を必要とされるケースは少ないため、未経験でも比較的採用されやすい職種です。ただ近年は外国人環境客に向けたサービスを取り入れている企業も増えており、英語力が問われる求人などもあるため、コミュニケーション力にプラスアルファの武器を備えておくと、より合格率は高まるでしょう。'

     when  '販売サービス'
      @memo = '販売サービスの仕事は多岐にわたりますが、基本的には商品を取り扱う実店舗で、対面での販売と接客をする仕事です。これまでの経験と近しい業界であれば、商品知識なども買われ、マネジメント候補として採用されるケースは高いでしょう。ただ近年は外国人環境客に向けたサービスを取り入れている企業も増えており、英語力が問われる求人などもあるため、コミュニケーション力にプラスアルファの武器を備えておくと、より合格率は高まるでしょう。'
    end
  end



  # (記者／ライター)ページを表示させる
  def writer

    writer = 0

    case current_user.career
     when '有形営業', '無形営業', "システムエンジニア", '物流倉庫管理', '一般事務', '経理', '人事', '総務', '販売サービス'
       career = 0.15
     when '商品サービス企画'
       career = 0.2
    end

    age = calc_age(current_user.age)

    career_age = calc_career_age(current_user.career_age)

    writer = career * age * career_age * 100
    @writer = writer

    @memo = '主に雑誌やWebの記事や広告などのコンテンツの、キャッチコピー、ボディコピー、本文などを担当する仕事です。読者やユーザーの潜在的なニーズをとらえ、興味関心をそそるような記事・コンテンツを作ります。近年これらの仕事は、企業で雇うよりも安価な外注化が進み、求人が減少している傾向にあります。本気で目指すのであれば、正社員での求人は稀ですので、フリーランスとして外注サイトに登録して腕を磨いていくことが最善の選択肢となるでしょう。'

  end




  private




  # 年齢に応じて合格率が変動するように設定
  def calc_age(age)
    case age
     when 20, 21, 22, 23, 24
      0.9
     when 25, 26, 27
      0.95
     when 28, 29
      0.9
    end
  end


  # 経験年数が長いほど合格率が高くなるように設定
  def calc_career_age(career_age)
    case career_age
     when 1
      0.85
     when 2
      0.9
     when 3, 4, 5
      0.95
     when 6, 7, 8, 9, 10
      0.98
    end
  end


  # キャリアアドバイザーは全ページに遷移できない設定
  def career_advisor
    if current_user.user_status == 'キャリアアドバイザー'
      redirect_to root_path
    end
  end


end
