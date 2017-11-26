wiki() {
    dig +short txt $1.wp.dg.cx
}

say() { 
    tl=$1
    shift 
    if [ "$1" = "-" ] ; then
        read text
        echo $text
    else
        text=$*
    fi
    text=$(echo $text | sed 's#\ #\+#g')
    mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=$tl&ie=UTF-8&q=$text" > /dev/null 2>&1 
}

translate() {
    sl=$1
    tl=$2
    shift
    shift
    text=$(echo $* | sed 's#\ #\+#g')
    len=`expr length "$text"`
    if [ -z "$text" ] ; then
        echo "Try again small friend"
        exit 4
    elif [ "$len" -gt "100" ] ; then
        echo "Cannot translate more than 100 characters at once ($len)"
        exit 2
    fi
    wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$text&sl=$sl&tl=$tl" | sed 's/\[\[\[\"//' | cut -d \" -f 1;
}

tsay() {
    translate $* | say $2 -
}

mem() {
    memfree=$( grep '^MemFree:' /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f", mem }' )
    buffers=$( grep '^Buffers:' /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f", mem }' )
    cached=$(  grep '^Cached:'  /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f", mem }' )
    free=$( echo $memfree+$buffers+$cached | bc -l )

    total=$( grep '^MemTotal:' /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f", mem }' )
    used=$( echo $total-$free | bc -l )
    pct=$( echo 100*$used/$total | bc -l )

    printf "%5.f MB used (%.0f%%)\n%5.f MB total\n" $used $pct $total
}

metacpan-favorites() {
    curl -s  https://metacpan.org/author/KABLAMO | perl -ne 'if (m!class="release".*/release/([^"]+)!) { $_ = $1; s/-/::/g; print $_,$/ }'
}
 
cpanm-metacpan-favorites() {
    metacpan-favorites | cpanm -nv
}

man() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}
