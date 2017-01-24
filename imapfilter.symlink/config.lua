options.timeout = 120
options.subscribe = true
options.create = true


file = assert(io.popen('python2 ~/.mutt/offlineimap.py ens-rennes', 'r'))
output = file:read('*a')
file:close()
output = string.gsub(output, "\n", "")


--function forever()
    local account = IMAP {
        server = 'imap.ens-rennes.fr',
        username = 'sbihe682',
        password = output,
    }

    account.INBOX:check_status()

    mails = account.INBOX:is_new() + account.INBOX:is_unseen()
    filtered = mails:contain_subject("[info.2015]")
    filtered:move_messages(account["info.2015"])
    filtered = mails:contain_subject("[info.news]")
    filtered:move_messages(account["info.news"])
    filtered = mails:contain_subject("[tous.eleves]")
    filtered:move_messages(account["tous.eleves"])
    filtered = mails:contain_subject("[SimGrid")
    filtered:move_messages(account["simgrid"])
    filtered = mails:contain_subject("[Users-g5k]")
    filtered:move_messages(account["grid5000"])
    filtered = mails:contain_from("easychair")
    filtered:move_messages(account["easychair"])
    filtered = mails:contain_from("piazza")
    filtered:move_messages(account["piazza"])
--end

--become_daemon(100, forever)
