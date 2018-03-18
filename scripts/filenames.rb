folder = 'worldevents'
filenames = Dir["E:/WoW Music/sound/music/#{folder}/*"]
File.open('filenames.txt', 'w+') do |f|
  filenames.each do |filename|
    f.puts("'#{folder}/#{filename.split('/')[-1].gsub(/.mp3/, '')}',")
  end
end
