function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 69272;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 69272 > /dev/null;
done;

for child in $(list_child_processes 69297);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/monicadinesh/Projects/Ranking_APP/Ranking_APP/bin/Debug/net7.0/af7706e5e8954ffe8e3cbc9edb5097ad.sh;
