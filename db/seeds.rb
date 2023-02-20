# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@example",
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
    {genre_id: genres[0].id, user_id: users[0].id, title: '学芸会①', body: '１年生の部の受付、誘導をお願いします', is_finished: 'completed', start_time: '2023-02-04 10:00:00', end_time: '2023-02-04 11:00:00'},
    {genre_id: genres[0].id, user_id: users[0].id, title: '学芸会②', body: '２年生の部の受付、誘導をお願いします', is_finished: 'completed', start_time: '2023-02-04 11:00:00' ,end_time: '2023-02-04 12:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: 'リユース交換会準備', body: 'リユース交換会の案内作成、配布・当日事前準備・当日片付けの役割分担を実施します。', is_finished: 'untouched', start_time: '2023-02-01 09:00:00' ,end_time: '2023-02-01 11:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: 'リユース交換会当日', body: '事前準備の方は１２：００集合、片付け担当の方は、５限後に集合してください。', is_finished: 'untouched', start_time: '2023-02-15 12:00:00' ,end_time: '2023-02-15 14:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: '講演会打合せ', body: '保護者向け講演会の打ち合わせを実施します。', is_finished: 'in_progress', start_time: '2023-02-06 09:00:00' ,end_time: '2023-02-06 11:00:00'},
    {genre_id: genres[1].id, user_id: users[1].id, title: '講演会当日', body: '保護者向け講演会当日です。講師アテンド担当は校門、会場運営担当は体育館に集合してください', is_finished: 'untouched', start_time: '2023-02-23 09:00:00' ,end_time: '2023-02-23 11:00:00'},
    {genre_id: genres[2].id, user_id: users[2].id, title: 'PTA新聞打合せ', body: 'PTA新聞作成の初回打ち合わせを実施します。', is_finished: 'untouched', start_time: '2023-02-15 09:00:00' ,end_time: '2023-02-15 11:00:00'},
    {genre_id: genres[2].id, user_id: users[2].id, title: 'PTA新聞完成', body: 'PTA新聞の完成締日です。印刷・折り込みまで実施します', is_finished: 'untouched', start_time: '2023-02-20 09:00:00' ,end_time: '2023-02-20 11:00:00'},
    {genre_id: genres[3].id, user_id: users[3].id, title: '春のパトロール', body: '通学路の危険箇所の点検です。各エリアごとに代表者２名でパトロールしてください', is_finished: 'completed', start_time: '2023-05-15 09:00:00' ,end_time: '2023-05-15 10:00:00'},
    {genre_id: genres[3].id, user_id: users[3].id, title: '夏のパトロール', body: '通学路の危険箇所の点検です。各エリアごとに代表者２名でパトロールしてください', is_finished: 'untouched', start_time: '2023-09-15 09:00:00' ,end_time: '2023-09-15 10:00:00'},
    {genre_id: genres[3].id, user_id: users[3].id, title: '冬のパトロール', body: '通学路の危険箇所の点検です。各エリアごとに代表者２名でパトロールしてください', is_finished: 'untouched', start_time: '2023-12-15 09:00:00' ,end_time: '2023-12-15 10:00:00'}
  ]
)

comments = Comment.create!(
  [
    {event_id: events[4].id, user_id: users[4].id, body: '事前にどのような講演が良いか案を持ってきてください'},
    {event_id: events[6].id, user_id: users[6].id, body: '希望者優先で役割分担を実施するため、全員出席をお願いします。'}
  ]
)

charges = Charge.create!(
  [
    {event_id: events[4].id, user_id: users[7].id},
    {event_id: events[9].id, user_id: users[9].id}
  ]
)

favorites = Favorite.create!(
  [
    {event_id: events[5].id, user_id: users[5].id},
    {event_id: events[8].id, user_id: users[8].id}
  ]
)