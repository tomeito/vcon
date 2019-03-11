require 'csv'

notifier = Slack::Notifier.new(ENV["WEBHOOK_URL"])
csv_answer = CSV.read('app/assets/form_answer.csv', headers: true)

csv_answer.each do |data|
  user = EntryUser.find_or_initialize_by(name: "#{data['参加キャラクター名']}",
                                         description: "#{data['キャラクターのプロフィール(60文字程度でお願いします。)']}",
                                         producer_id: "#{Producer.find_by(name: data['制作者の個人名・団体名'])}")
  if user.new_record?
    user.save!
    # notifier.ping("新しい参加者だよ！\n名前:#{user.name}\n")
    p "新しい参加者だよ！\n名前:#{user.name}"
  end
end
