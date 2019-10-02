for i in 'Python' 'Linux_LearningNotes' 'Course_Materials' 'GitHub_Introduction_and_Practice_Notes'
do
  cd /home/sayori/git_local/$i
  git add -A
  git commit -m "regular update"
  git push origin master
done
