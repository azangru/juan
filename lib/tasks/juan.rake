require 'csv'

desc "1) Create database of texts of Don Juan from csv file; 2) Create database of comments to Don Juan from another csv file"
task :create_juan => :environment do

  file1 = "db/juan.csv"
  CSV.foreach(file1, :headers => true) do |row|
    c1 = Canto.find_or_create_by_name(row[4])
    if row[0] == nil || row[0] == ''
      ct1 = CantoTranslation.create!(
        canto_id: c1.id,
        translation_id: Translation.where(name: "English original").first.id,
        title: row[1],
        comment: (row[1].match(/\|\|\|(.*)\|\|\|/)[1] unless row[1].match(/\|\|\|(.*)\|\|\|/) == nil)
      )
      ct2 = CantoTranslation.create!(
        canto_id: c1.id,
        translation_id: Translation.where(name: "Russian translation by Tatiana Gnedich").first.id,
        title: row[2],
        comment: (row[2].match(/\|\|\|(.*)\|\|\|/)[1] unless row[2].match(/\|\|\|(.*)\|\|\|/) == nil)
      )
      ct3 = CantoTranslation.create!(
        canto_id: c1.id,
        translation_id: Translation.where(name: "Russian translation by Georgy Shengeli").first.id,
        title: row[3],
        comment: (row[3].match(/\|\|\|(.*)\|\|\|/)[1] unless row[3].match(/\|\|\|(.*)\|\|\|/) == nil)
      )
    else
      s1 = Stanza.create!(
        canto_id: c1.id,
        number: row[0].to_i
      )
      st1 = StanzaTranslation.create!(
        stanza_id: s1.id,
        translation_id: Translation.where(name: "English original").first.id,
        text: row[1]
      )
      st2 = StanzaTranslation.create!(
        stanza_id: s1.id,
        translation_id: Translation.where(name: "Russian translation by Tatiana Gnedich").first.id,
        text: row[2]
      )
      st3 = StanzaTranslation.create!(
        stanza_id: s1.id,
        translation_id: Translation.where(name: "Russian translation by Georgy Shengeli").first.id,
        text: row[3]
      )
    end
  end

  file2 = "db/comments.csv"
  CSV.foreach(file2, :headers => true) do |row|
    a1 = Annotator.find_or_create_by_name(row[2])
    c1 = Comment.create!(
      number: row[0].to_i,
      text: row[1],
      annotator_id: a1.id
    )
  end  

end

