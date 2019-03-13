require 'csv'

notifier = Slack::Notifier.new(ENV["WEBHOOK_URL"])
csv_answer = CSV.read('app/assets/form_answer.csv', headers: true)

csv_answer.each do |data|
  producer = Producer.find_or_initialize_by(name "#{data['制作者の個人名・団体名']}")
  if producer.new_record?
    producer.update_attributes(
            name: "#{data['制作者の個人名・団体名']}",
        comments: "#{data['出場に対して意気込みを一言']}"

    )
  end
  # p data['参加キャラクター名']
  user = EntryUser.find_or_initialize_by(name: "#{data['参加キャラクター名']}")
  if user.new_record?
    user.update_attributes(
               name: "#{data['参加キャラクター名']}",
        description: "#{data['キャラクターのプロフィール(60文字程度でお願いします。)']}",
        producer_id: "#{Producer.find_by(name: data['制作者の個人名・団体名'])}"
    )
    notifier.ping("新しい参加者だよ！\n名前:#{user.name}\n")
    p "新しい参加者だよ！\n名前:#{user.name}"
  end
end
