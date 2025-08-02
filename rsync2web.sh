#!/bin/bash
purpose()  { echo "Updates website events"; }
usage() { echo "Usage: $0 [-h] optional extra filenames (else will do all)" 1>&2; exit 0; }
#time=50 #default
while getopts ":ht:" opt; do
  case ${opt} in
    h ) purpose; usage ;;
    t ) TEST=$OPTARG ;;
    : ) echo "Invalid option: $OPTARG requires an argument" 1>&2;  exit 1 ;;
    \? ) usage ;;
  esac
done
shift $((OPTIND -1))

pushd ~/newlife/git/events
echo "<\`" > news.inc
cat ~/newlife/mailings/a_webversion.txt >> news.inc
echo "\`>" >> news.inc

A=men
B=women
C=other
D=prayer
E=sunday
F=training
G=social
N=news.inc
S=shortcuts
if [ -n "$1" ]; then echo "syncing extra files: $1 $2 $3 $4 $5"; fi
rsync -av $A.txt $B.txt $C.txt $D.txt $E.txt $F.txt $G.txt $S.txt $N $1 $2 $3 $4 $5 andrewfountain:/home/plousia/nlife2/git/events/
popd
pushd ~/newlife/teams;
~/code/python/nl-schedmail.py -v -w
~/code/python/nl-schedmail.py -v -W
popd
#rsync -av --delete /home/andrew/business/www/newlife_to/images ocean:/home/test/cto/
#rsync -av --delete /home/andrew/newlife/mailings/a_webversion.html ocean:/home/test/cto/news/index.html
#wrong version: cp -av /home/andrew/newlife/mailings/a_webversion.txt /home/andrew/business/hugo/newlife_our/source/news.inc
