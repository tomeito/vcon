require 'csv'

notifier = Slack::Notifier.new(ENV["WEBHOOK_URL"])
csv_answer = CSV.read('app/assets/form_answer.csv', headers: true)

csv_answer.each do |data|
  # p data['参加キャラクター名']
  user = EntryUser.find_or_initialize_by(name: data['参加キャラクター名'])
  if user.new_record?
    user.update_attributes(
               name: data['参加キャラクター名'],
        description: data['キャラクターのプロフィール(60文字程度でお願いします。)'],
           comments: data['出場に対して意気込みを一言'],
        twitter_url: data['TwitterのURL'],
    youtube_channel: data['YouTubeのチャンネルURL'],
          other_url: data['その他SNSなどのリンク']
    )
    # notifier.ping("新しい参加者だよ！\n名前:#{user.name}\n")
    puts "新しい参加者だよ！\n名前:#{user.name}"
  end

  form_images = data['スナップ写真4枚(全身が見えるものを一枚以上)'].gsub(' ','').split(',')
  main_image = Image.find_or_initialize_by(url: form_images.first)
  if main_image.new_record?
    main_image.update_attributes(
        url: form_images.first.sub('open?','uc?export=view&'),
        entry_user_id: EntryUser.find_by(name: data['参加キャラクター名']).id,
        is_top_image: true
    )
  end
  form_images.shift

  form_images.each do |form_image|
    sub_image = Image.find_or_initialize_by(url: form_image)
    if sub_image.new_record?
      sub_image.update_attributes(
          url: form_image.sub('open?','uc?export=view&'),
          entry_user_id: EntryUser.find_by(name: data['参加キャラクター名']).id,
          is_top_image: false
      )
    end
  end

end
