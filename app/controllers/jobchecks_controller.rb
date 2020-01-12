class JobchecksController < ApplicationController

  def top
  end

  def manufacturer_sales

     manufacturer_sales = 0

     case current_user.career
       when '有形営業'
         career = 0.95
       when '無形営業'
         career = 0.8
       when '商品企画'
         career = 0.7
       when '物流倉庫管理'
         career = 0.6
       when '一般事務', '人事', '経理', '総務', 'システムエンジニア'
         career = 0.4
       when '販売サービス'
         career = 0.5
     end

     case current_user.age
       when 20, 21, 22, 23, 24
      	 age = 0.9
       when 25, 26, 27
         age = 0.95
       when 28, 29
         age = 0.9
     end

     case current_user.career_age
       when 1
         career_age = 0.85
       when 2
         career_age = 0.9
       when 3, 4, 5
         career_age = 0.95
       when 6, 7, 8, 9, 10
         career_age = 0.98
     end

     manufacturer_sales = career * age * career_age * 100
     @manufacturer_sales = manufacturer_sales


     case current_user.career
       when '有形営業'
        @memo = '志望する業界によって就職難易度は変わりますが、これまで有形物を扱っていた点においては、比較的経験の親和性はあり、転職成功率は高いと思われます。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。あまり選り好みすると転職が長引く可能性があるため注意が必要です。'

       when '無形営業'
        @memo = '経験業界は異なりますが、これまでの顧客折衝経験を活かし、比較的転職はしやすい可能性が高いです。ただ大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。あまり選り好みすると転職が長引く可能性があるため注意が必要です。'

       when '商品サービス企画'
        @memo = 'これまで企画していた商品やサービスのジャンルが、志望する業界に親和性があれば、営業職への転職も可能性は広がります。ただ顧客折衝経験が弱いく完全未経験としてみられるため、ハードルはやや高いです。また大手のメーカー・商社は、新卒採用で人員を確保している企業がほとんどであるため、そもそも求人の母数が少ない傾向にあります。'

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


  def it_sales

    it_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.8
     when '無形営業'
       career = 0.9
     when '商品サービス企画'
       career = 0.7
     when '物流倉庫管理'
       career = 0.55
     when '一般事務', '人事', '経理', '総務'
       career = 0.5
     when '販売サービス', 'システムエンジニア'
       career = 0.6
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

    it_sales = career * age * career_age * 100
    @it_sales = it_sales


    case current_user.career
     when '有形営業'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。顧客折衝という点では、比較的経験が活かしやすいですが、スピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '無形営業'
      @memo = '形のない商品（サービス）を売ってきた経験は、IT営業との親和性があり、転職には有利な武器となります。またIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。無論、企業によって求める人物像や経験は異なるため、面接対策は怠らないよう注意しましょう。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。これまで企画していた商品やサービスのジャンルがIT業界に親和性があれば、転職の可能性は広がります。ただ顧客折衝経験が弱いく完全未経験としてみられるため、ハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '人事'
      @memo = '採用業務などで数字を追っていた経験があれば、営業でも活かせると判断され、転職の可能性は広がります。ただIT業界は、スピード感に順応できるかという点を強くみられるため、必ずしも転職が容易であるとは言えません。顧客折衝経験が全くない場合は完全未経験としてみられるため、総じてハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when 'システムエンジニア'
      @memo = 'これまで経験したIT知見が志望する業界の商材と親和性があれば、転職成功率は上がります。ただ顧客折衝経験が全くない場合は未経験としてみられるため、総じてハードルは高いです。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'

     when '販売サービス'
      @memo = 'IT営業は、論理的思考力とスピード感が求められます。これまでの顧客折衝経験を活かし、転職できる可能性はありますが、スピード感に順応できるかという点を強くみられることと、法人営業経験がないという点で、総じてハードルが高い職種です。ただIT業界は成長産業であり、複数名採用の求人が多い傾向にあるため、間口は広いといえるでしょう。'
    end
  end


  def real_estate_sales

    real_estate_sales = 0

    case current_user.career
     when '有形営業', '無形営業'
       career = 0.9
     when '商品サービス企画', '物流倉庫管理'
       career = 0.7
     when '一般事務', '人事', '経理', '総務', 'システムエンジニア'
       career = 0.6
     when '販売サービス'
       career = 0.8
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

    real_estate_sales = career * age * career_age * 100
    @real_estate_sales = real_estate_sales


    case current_user.career
     when '有形営業', '無形営業'
      @memo = '不動産営業には、長期的な視点や、高額な予算を取り扱える提案力、課題解決力が求められます。また前のめりで押しの強い人柄が好まれる傾向にあります。顧客折衝経験が活きるため、賃貸などの個人営業であればさほどハードルは高くありませんが、大手ゼネコンや住宅メーカーなどの企業は高額商品を売ってきた経験値を強くみるため、間口が広いとは言えません。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = '不動産営業には、長期的な視点や、高額な予算を取り扱える提案力、課題解決力が求められます。また前のめりで押しの強い人柄が好まれる傾向にあります。他の営業職と同じく、顧客折衝経験が少ない場合完全未経験としてみられるため、ハードルはやや高いです。ただ1から営業力を身に着けたい意欲があれば、未経験歓迎求人は多い職種であるため、チャレンジできる余地はある職種となります。その際は飛込みなどの新規開拓からスタートする覚悟が必要です。'

    end
  end


  def mr_sales

    mr_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.7
     when '無形営業'
       career = 0.6
     when '商品サービス企画'
       career = 0.5
     when '物流倉庫管理'
       career = 0.45
     when '一般事務', '人事', '経理', '総務', 'システムエンジニア'
       career = 0.3
     when '販売サービス'
       career = 0.45
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

    mr_sales = career * age * career_age * 100
    @mr_sales = mr_sales


    case current_user.career
     when '有形営業', '無形営業'
      @memo = 'MRは、医療技術の発達により今後も需要が高まっていく職種といえます。ただ専門的知識を問われる職種であり、地頭や高い提案能力を求められるため、転職のハードルは非常に高い職種といえるでしょう。これまでの顧客折衝経験が活きる要素はありますが、高度な専門知識が問われるMRよりは、医療機器営業などでステップを積んでから転職することが現実的な選択肢となります。'

     when '商品サービス企画', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = 'MRは、医療技術の発達により今後も需要が高まっていく職種といえます。ただ専門的知識を問われる職種であり、地頭や高い提案能力を求められるため、転職のハードルは非常に高い職種といえるでしょう。高度な専門知識が問われるMRよりは、医療機器営業などでステップを積んでから転職することが現実的な選択肢となります。医療機器営業で未経験OK求人は多いとはいえないため、選り好みはしないよう注意しましょう。'

    end
  end


  def human_resources_sales

    human_resources_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.9
     when '無形営業'
       career = 0.95
     when '商品サービス企画', '販売サービス'
       career = 0.7
     when '物流倉庫管理'
       career = 0.6
     when '一般事務', '経理', '総務', 'システムエンジニア'
       career = 0.55
     when '人事'
       career = 0.8
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

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


  def webad_sales

    webad_sales = 0

    case current_user.career
     when '有形営業'
       career = 0.9
     when '無形営業'
       career = 0.95
     when '商品サービス企画'
       career = 0.7
     when '物流倉庫管理'
       career = 0.55
     when '一般事務', '経理', '総務', 'システムエンジニア', '人事'
       career = 0.5
     when '販売サービス'
       career = 0.6
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

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


  def service_planning

    service_planning = 0

    case current_user.career
     when '有形営業', '無形営業'
       career = 0.4
     when '商品サービス企画'
       career = 0.65
     when '一般事務', '経理', '総務', 'システムエンジニア', '人事', '物流倉庫管理'
       career = 0.3
     when '販売サービス'
       career = 0.35
    end

    case current_user.age
     when 20, 21, 22, 23, 24
       age = 0.9
     when 25, 26, 27
       age = 0.95
     when 28, 29
       age = 0.9
    end

    case current_user.career_age
     when 1
       career_age = 0.85
     when 2
       career_age = 0.9
     when 3, 4, 5
       career_age = 0.95
     when 6, 7, 8, 9, 10
       career_age = 0.98
    end

    service_planning = career * age * career_age * 100
    @service_planning = service_planning


    case current_user.career
     when '有形営業', '無形営業', '物流倉庫管理', '一般事務', '経理', '総務', '人事', 'システムエンジニア', '販売サービス'
      @memo = '商品企画担当は、ユーザーのニーズが多様化していることを背景に、きめ細かいマーケティング力が求められます。求められるスキルの専門性が高い上に、募集人員も1名枠の求人がほとんどであるため、極めて狭き門となります。ネット広告の市場が活発しているため、Web広告代理店やリサーチ会社などで経験を積んだ後、ステップアップとして転職するのは1つの手です。'

     when '商品サービス企画'
      @memo = '商品企画担当は、ユーザーのニーズが多様化していることを背景に、きめ細かいマーケティング力が求められます。これまで経験した業界や、取り扱っていた商品に親和性があれば、経験を買ってもらいやすい職種ですが、昨今ネット広告の市場が活発している影響から、事業会社の商品企画担当出身者よりも、Web広告の知見がある代理店出身者を採用する傾向も多くあります。'
    end
  end























end
