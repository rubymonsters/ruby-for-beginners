CHAPTERS = FileList[
  'source/**/*.md'
]

file 'ruby-for-beginners.pdf' => CHAPTERS do
  sh <<-CMD
    pandoc --toc --toc-depth=2 --latex-engine=xelatex -V documentclass=report -o ruby-for-beginners.pdf #{CHAPTERS}
  CMD
end

file 'ruby-for-beginners.epub' => CHAPTERS  do
  sh <<-CMD
    pandoc --toc --toc-depth=2 -S --epub-metadata=data/book.yml -o ruby-for-beginners.epub #{CHAPTERS}
  CMD
end

task pdf:  %W{ ruby-for-beginners.pdf }
task epub: %W{ ruby-for-beginners.epub }

task default: %W{ pdf epub }
