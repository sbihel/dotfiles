if [[ $OSTYPE != 'linux-gnu' ]]; then
    reattach-to-user-namespace terminal-notifier -title "📧 $1" -subtitle "New Mail in $2" -message "$3 new messages, $4 unread." -activate "iTerm2"
fi
