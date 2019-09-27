for i in 'Python' 'Linux_LearningNotes' 'Course_C_LanguageProgramming' 'Course_R_LanguageProgramming'
do
  cd /home/sayori/git_local/$i
  git add -A
  git commit -m "regular update"
  git push origin master
done