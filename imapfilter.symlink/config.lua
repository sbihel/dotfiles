options.timeout = 120
options.subscribe = true
options.create = true


file = assert(io.popen('python ~/.mutt/offlineimap.py ens-rennes', 'r'))
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

    filtered = mails:contain_subject("[info.2015]") +
               mails:contain_subject("[info.m2.2017]")
    filtered:move_messages(account["info.2015"])

    filtered = mails:contain_subject("[info.news]")
    filtered:move_messages(account["info.news"])

    filtered = mails:contain_subject("[tous.eleves]")
    filtered:move_messages(account["tous.eleves"])

    filtered = mails:contain_subject("[SimGrid")
    filtered:move_messages(account["simgrid"])

    filtered = mails:contain_from("easychair")
    filtered:move_messages(account["easychair"])

    filtered = mails:contain_from("piazza")
    filtered:move_messages(account["piazza"])

    filtered = mails:contain_subject("[GP]")
    filtered:move_messages(account["GP"])

    filtered = mails:contain_subject("[Wala-wala]")
    filtered:move_messages(account["WALA"])

    filtered = mails:contain_from("narrative.ly") +
               mails:contain_from("guernicamag.com") +
               mails:contain_from("longreads.com") +
               mails:contain_from("nplusonemag.com") +
               mails:contain_from("reallifemag.com") +
               mails:contain_from("0s-1s.com") +
               mails:contain_from("anxymag.com") +
               mails:contain_from("jamesclear.com") +
               mails:contain_from("a f a s i a") +
               mails:contain_from("japan-architect.co.jp") +
               mails:contain_from("divisare.com") +
               mails:contain_from("readingdesign.org") +
               mails:contain_from("drawingmatter.org") +
               mails:contain_from("koreaexpose.com")
    filtered:move_messages(account["reading"])

    filtered = mails:contain_subject("cs daily")
    filtered:move_messages(account["arXiv"])

    filtered = mails:contain_subject("[assert]")
    filtered:move_messages(account["assert"])
--end

--become_daemon(100, forever)
