# Get rating
# > 7 - Good
# < 7 - Average

input=$1
if [ -z "$input" ]; then
  echo Input Movie Name Missing
  exit
fi

percent=(curl -s  https://www.themoviedb.org/movie/$input | grep -w  77 | xargs -n1 | grep data-percent | awk -F = '{print $2}')

echo Percent - $percent

if [ "$percent" -ge 70 ]; then
  echo Good
else
  echo Average
fi
