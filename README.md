# Name
「Job Matching」
<kbd>![top](https://user-images.githubusercontent.com/56952436/74013061-faeabd80-49ce-11ea-9095-b670f91e1885.JPG)</kbd>
<br>
<br>
# Overview
求職者の「転職活動」と、キャリアアドバイザーの「採用活動」を成功させる<br>
転職専門マッチングアプリです。
<br>
<br>
# Description
求職者マイページ
<kbd>![求職者TOP](https://user-images.githubusercontent.com/56952436/74013047-f8886380-49ce-11ea-8b9d-dbf3164200b8.JPG)</kbd>
<br>
<br>
求職者は求人を検索することができます。
<kbd>![求人検索](https://user-images.githubusercontent.com/56952436/74013049-f8886380-49ce-11ea-88c2-9e0195b674c2.JPG)</kbd>
<br>
<br>
求人の詳細ページから「興味があるボタン」を押すと、担当キャリアアドバイザーに通知が届きます。
<kbd>![求人詳細画面](https://user-images.githubusercontent.com/56952436/74013052-f920fa00-49ce-11ea-8791-024a3b1e9d85.JPG)</kbd>
<br>
<br>
担当キャリアアドバイザーとチャットで会話することができます。
<kbd>![チャット](https://user-images.githubusercontent.com/56952436/74013065-fb835400-49ce-11ea-8648-bdfed53ca4f6.JPG)</kbd>
<br>
<br>
求職者は「転職診断」ページから、希望する職種への合格率を確かめることができます。
<kbd>![転職診断TOP](https://user-images.githubusercontent.com/56952436/74013057-fa522700-49ce-11ea-81a2-715ea44a0b27.JPG)</kbd>
<br>
<br>
登録している経歴をもとに、合格率が算出されます。
<kbd>![診断結果](https://user-images.githubusercontent.com/56952436/74013055-f9b99080-49ce-11ea-97ab-eae70bee3efb.JPG)</kbd>
<br>
<br>
キャリアアドバイザーマイページ
<kbd>![CATOP](https://user-images.githubusercontent.com/56952436/74013060-fa522700-49ce-11ea-8e0e-c00e13bb3abc.JPG)</kbd>
<br>
<br>
お知らせページより、イイネやフォローされた通知を確認することができます。
<kbd>![お知らせ](https://user-images.githubusercontent.com/56952436/74013062-faeabd80-49ce-11ea-86b6-81605e837ffb.JPG)</kbd>
<br>
<br>
お知らせは、登録メールアドレス宛にも通知が届きます。
<kbd>![メール](https://user-images.githubusercontent.com/56952436/74014311-b44a9280-49d1-11ea-9a09-c61984d9069c.JPG)</kbd>
<br>
<br>
キャリアアドバイザーは、求人を登録し掲載することができます。
<kbd>![求人追加](https://user-images.githubusercontent.com/56952436/74013053-f9b99080-49ce-11ea-8784-79ba85892b32.JPG)</kbd>
<br>
<br>
担当する求人にマッチする求職者を検索し、アプローチすることができます。
<kbd>![ユーザー一覧](https://user-images.githubusercontent.com/56952436/74013066-fc1bea80-49ce-11ea-85c5-642223a963f9.JPG)</kbd>
<br>
<br>
細かい業務を可視化するため、タスクを登録し管理することができます。
<kbd>![タスク管理](https://user-images.githubusercontent.com/56952436/74013064-fb835400-49ce-11ea-8608-b5fba0e281b6.JPG)</kbd>
<br>
<br>
# technique
＜取り入れた技術＞<br>
【HTML/CSS】<br>
・HTML/CSS<br>
・Bootstrap<br>
 <br>
【JavaScript】<br>
・jQuery　（Datepickerカレンダー表示など）<br>
・Ajax　（「イイネ」や「フォロー」の非同期処理）<br>
 <br>
【Ruby/Rails】<br>
・投稿機能<br>
・プルダウン検索機能<br>
・イイネ機能<br>
・フォロー機能<br>
・通知機能<br>
・Action Cable　（チャット）<br>
・Action Mailer　（通知機能）<br>
・Active Job<br>
・部分テンプレート<br>
・case文を使用した処理<br>
・Rspec　（テストコード）<br>
 <br>
【Gem】<br>
・devise （ログイン機能）<br>
・refile　（画像投稿機能）<br>
・kaminari　（ページャー実装）<br>
・rails-i18n　（エラーメッセージ等の日本語化）<br>
 <br>
【インフラ(AWSなど)】<br>
・EC2<br>
・RDS<br>
<br>
<br>
# Sample user
【一般ユーザー】<br>
ID：aaa@aaa  PASS：aaaaaa<br>
【CA側】<br>
ID：jobcheck.app@gmail.com　PASS：bbbbbb<br>
<br>
<br>

