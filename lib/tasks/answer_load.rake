namespace :drive do
  desc "Google Driveから参加フォームの回答を取得し、ローカルのcsvファイルに書き込む"
  task :answer_load do
    begin
      puts 'connecting...'
      session = GoogleDrive::Session.from_config('config.json')
      puts 'loading...'
      answer_file = session.spreadsheet_by_url('https://docs.google.com/spreadsheets/d/1K7u1yqM-ImQKZvFS_WzkWoErdzitOFX657fZQWKyvds/edit#gid=551320858')
      # 保存先のファイルが存在しないとエラー吐く
      answer_file.export_as_file('app/assets/form_answer.csv', 'text/csv')
      puts "Finish! \ncheck app/assets/form_answer.csv"
    rescue => error
      p "google drive error!\n#{error}"
    end
  end
end

