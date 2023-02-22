# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@test.com",
  password: "password"
)

genres = Genre.create!(
  [
    {name: '学年部'},
    {name: '成人教育部'},
    {name: '広報部'},
    {name: '校外補導部'}
  ]
)

users = User.create!(
  [
    {last_name: '田中', first_name: '太郎', email: 'tanaka@test.com', telephone_number: '0001112222', password: 'password', is_deleted: false },
    {last_name: '佐藤', first_name: '花子', email: 'sato@test.com', telephone_number: '0001113333', password: 'password', is_deleted: false },
    {last_name: '鈴木', first_name: '一郎', email: 'suzuki@test.com', telephone_number: '0001113333', password: 'password', is_deleted: false },
    {last_name: '高橋', first_name: 'さくら', email: 'takahashi@test.com', telephone_number: '0001114444', password: 'password', is_deleted: false },
    {last_name: '伊藤', first_name: '次郎', email: 'ito@test.com', telephone_number: '0001115555', password: 'password', is_deleted: false },
    {last_name: '渡辺', first_name: '桃香', email: 'watanabe@test.com', telephone_number: '0001116666', password: 'password', is_deleted: false },
    {last_name: '山本', first_name: '健太', email: 'yamamoto@test.com', telephone_number: '0001117777', password: 'password', is_deleted: false },
    {last_name: '中村', first_name: '美咲', email: 'nakamura@test.com', telephone_number: '0001118888', password: 'password', is_deleted: false },
    {last_name: '小林', first_name: '拓也', email: 'kobayashi@test.com', telephone_number: '0001119999', password: 'password', is_deleted: false },
    {last_name: '加藤', first_name: '愛', email: 'kato@test.com', telephone_number: '0002223333', password: 'password', is_deleted: false },
    {last_name: '吉田', first_name: '翼', email: 'yoshida@test.com', telephone_number: '0003333333', password: 'password', is_deleted: true },
    {last_name: '山田', first_name: '遥', email: 'yamada@test.com', telephone_number: '0004443333', password: 'password', is_deleted: false }
  ]
)

events = Event.create!(
  [
    {genre_id: genres[0].id, user_id: users[0].id, title: '学芸会１年生', body: '１年生の部の受付、誘導をお願いします', is_finished: 'in_progress', start_time: '2023-02-18 10:00:00', end_time: '2023-02-18 11:00:00'},
    {genre_id: genres[0].id, user_id: users[0].id, title: '学芸会２年生', body: '２年生の部の受付、誘導をお願いします', is_finished: 'untouched', start_time: '2023-02-18 11:00:00' ,end_time: '2023-02-18 12:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: 'リユース交換会準備', body: 'リユース交換会の案内印刷、当日事前準備・当日片付けの役割分担を実施します。', is_finished: 'completed', start_time: '2023-02-01 09:00:00' ,end_time: '2023-02-01 11:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: 'リユース交換会当日', body: '事前準備の方は１２：００集合、片付け担当の方は、５限後に集合してください。', is_finished: 'untouched', start_time: '2023-02-15 12:00:00' ,end_time: '2023-02-15 14:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: '講演会準備', body: '保護者向け講演会の打ち合わせを実施します。', is_finished: 'completed', start_time: '2023-02-06 09:00:00' ,end_time: '2023-02-06 11:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: '講演会当日', body: '保護者向け講演会当日です。講師アテンド担当は校門、会場運営担当は体育館に集合してください', is_finished: 'untouched', start_time: '2023-02-23 09:00:00' ,end_time: '2023-02-23 11:00:00'},
    {genre_id: genres[2].id, user_id: users[2].id, title: 'PTA新聞準備', body: 'PTA新聞作成の初回打ち合わせを実施します。', is_finished: 'in_progress', start_time: '2023-02-15 09:00:00' ,end_time: '2023-02-15 11:00:00'},
    {genre_id: genres[2].id, user_id: users[2].id, title: 'PTA新聞完成', body: 'PTA新聞の完成締日です', is_finished: 'untouched', start_time: '2023-02-20 09:00:00' ,end_time: '2023-02-20 11:00:00'},
    {genre_id: genres[3].id, user_id: users[3].id, title: '夏のパトロール', body: '通学路の危険箇所の点検です。各エリアごとに代表者２名でパトロールしてください', is_finished: 'completed', start_time: '2022-07-15 09:00:00' ,end_time: '2022-07-15 10:00:00'},
    {genre_id: genres[3].id, user_id: users[3].id, title: '冬のパトロール', body: '通学路の危険箇所の点検です。各エリアごとに代表者２名でパトロールしてください', is_finished: 'completed', start_time: '2022-12-15 09:00:00' ,end_time: '2022-12-15 10:00:00'}
  ]
)

comments = Comment.create!(
  [
    {event_id: events[0].id, user_id: users[4].id, body: '受付担当します。ボールペンを数本用意します。'},
    {event_id: events[0].id, user_id: users[5].id, body: '誘導係担当します。誘導の際に必要なものはありますか？'},
    {event_id: events[0].id, user_id: users[0].id, body: 'ボードを持って巡回してもらいます。当日持お渡しするのでよろしくお願いします'},
    {event_id: events[1].id, user_id: users[0].id, body: '備品等は１年生担当の方から引き継いでください'},
    {event_id: events[2].id, user_id: users[1].id, body: 'リユース品の量が多い場合、保管場所が変更になる可能性があります。その場合、またご連絡します。'},
    {event_id: events[3].id, user_id: users[1].id, body: '当日持ち込みの品物は一旦預かってください。次回に回します。'},
    {event_id: events[4].id, user_id: users[2].id, body: '事前にどのような講演が良いか案を持ってきてください'},
    {event_id: events[4].id, user_id: users[9].id, body: '今まではどのような講演をしていただいていたのでしょうか？'},
    {event_id: events[4].id, user_id: users[2].id, body: '直近だと、「子供と携帯電話」、「自転車の交通ルール」、「怒らない子育て」の内容で講演していただいています。'},
    {event_id: events[4].id, user_id: users[9].id, body: 'ありがとうございます！内容が重ならない方がいいですね。'},
    {event_id: events[5].id, user_id: users[2].id, body: '変更点です。講演して頂く先生の待機場所は、応接室になりました。'},
    {event_id: events[5].id, user_id: users[8].id, body: '謝礼のお支払いのタイミングと費用の準備について教えてください。一旦建て替えですか？'},
    {event_id: events[5].id, user_id: users[2].id, body: '謝礼のお支払いは講演後に応接室でお渡しする予定です。費用は会計の長谷川さんに請求書を渡して事前にもらってください'},
    {event_id: events[5].id, user_id: users[8].id, body: '了解しました！ありがとうございます。'},
    {event_id: events[6].id, user_id: users[2].id, body: '役割分担を実施します。希望者を募りますが、PCが無くて編集作業ができない方は当日教えてください'},
    {event_id: events[6].id, user_id: users[10].id, body: 'すみません、仕事で出席できません。PCは自宅にあります。'},
    {event_id: events[6].id, user_id: users[2].id, body: '了解です。ご連絡ありがとうございます！'},
    {event_id: events[7].id, user_id: users[2].id, body: '名前の確認はWチェックしましよう。３日前までに、原稿データを送ってもらえますか？'},
    {event_id: events[7].id, user_id: users[11].id, body: '了解です。よろしくお願いします。'},
    {event_id: events[9].id, user_id: users[3].id, body: '今期は西地区のパトロールです'},
    {event_id: events[9].id, user_id: users[11].id, body: '分団A：西田さん、分団B：前田さん、が参加です。'},
    {event_id: events[9].id, user_id: users[3].id, body: '了解です。当日校門集合でよろしくお願いします'},
    {event_id: events[8].id, user_id: users[3].id, body: '今期は東地区のパトロールです'},
    {event_id: events[8].id, user_id: users[10].id, body: '分団A：服部さん、分団B：吉村さん、が参加です。'},
    {event_id: events[8].id, user_id: users[3].id, body: '了解です。当日校門集合でよろしくお願いします'}
  ]
)

charges = Charge.create!(
  [
    {event_id: events[0].id, user_id: users[0].id},
    {event_id: events[0].id, user_id: users[4].id},
    {event_id: events[0].id, user_id: users[5].id},
    {event_id: events[2].id, user_id: users[4].id},
    {event_id: events[2].id, user_id: users[5].id},
    {event_id: events[2].id, user_id: users[1].id},
    {event_id: events[3].id, user_id: users[1].id},
    {event_id: events[3].id, user_id: users[6].id},
    {event_id: events[3].id, user_id: users[7].id},
    {event_id: events[4].id, user_id: users[2].id},
    {event_id: events[4].id, user_id: users[8].id},
    {event_id: events[4].id, user_id: users[9].id},
    {event_id: events[5].id, user_id: users[2].id},
    {event_id: events[5].id, user_id: users[8].id},
    {event_id: events[5].id, user_id: users[9].id},
    {event_id: events[6].id, user_id: users[2].id},
    {event_id: events[6].id, user_id: users[10].id},
    {event_id: events[6].id, user_id: users[11].id},
    {event_id: events[7].id, user_id: users[2].id},
    {event_id: events[7].id, user_id: users[10].id},
    {event_id: events[7].id, user_id: users[11].id},
    {event_id: events[8].id, user_id: users[3].id},
    {event_id: events[8].id, user_id: users[10].id},
    {event_id: events[9].id, user_id: users[3].id},
    {event_id: events[9].id, user_id: users[11].id}
  ]
)

favorites = Favorite.create!(
  [
    {event_id: events[0].id, user_id: users[0].id},
    {event_id: events[0].id, user_id: users[4].id},
    {event_id: events[0].id, user_id: users[5].id},
    {event_id: events[1].id, user_id: users[0].id},
    {event_id: events[1].id, user_id: users[6].id},
    {event_id: events[1].id, user_id: users[7].id},
    {event_id: events[2].id, user_id: users[1].id},
    {event_id: events[2].id, user_id: users[4].id},
    {event_id: events[2].id, user_id: users[5].id},
    {event_id: events[3].id, user_id: users[1].id},
    {event_id: events[3].id, user_id: users[6].id},
    {event_id: events[3].id, user_id: users[7].id},
    {event_id: events[4].id, user_id: users[2].id},
    {event_id: events[4].id, user_id: users[8].id},
    {event_id: events[4].id, user_id: users[9].id},
    {event_id: events[5].id, user_id: users[2].id},
    {event_id: events[5].id, user_id: users[8].id},
    {event_id: events[5].id, user_id: users[9].id},
    {event_id: events[6].id, user_id: users[2].id},
    {event_id: events[6].id, user_id: users[10].id},
    {event_id: events[6].id, user_id: users[11].id},
    {event_id: events[7].id, user_id: users[2].id},
    {event_id: events[7].id, user_id: users[10].id},
    {event_id: events[7].id, user_id: users[11].id},
    {event_id: events[8].id, user_id: users[3].id},
    {event_id: events[9].id, user_id: users[3].id},
    {event_id: events[8].id, user_id: users[10].id},
    {event_id: events[9].id, user_id: users[11].id},
  ]
)