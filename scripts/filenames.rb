folder = 'zonemusic'
filenames = Dir["E:/WoW Music/sound/music/#{folder}/**/*"]
File.open('filenames.txt', 'w+') do |f|
  filenames.each do |filename|
    f.puts("'#{filename
                   .gsub(/E:\/WoW Music\/sound\/music\//, '')
                   .gsub(/.mp3/, '')}',") if filename.include? '.mp3'
  end
end
