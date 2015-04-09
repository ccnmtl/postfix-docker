stripped down postfix container designed for linking to docker containers.

minimal image running postfix and rsyslog. configured to relay for
other docker containers (on docker's 172.17.0.0/16 range).

So, you would run it with something like:

    $ docker run --name=postfix -e MAILNAME=mail.myserver.com \
      localhost:5000/ccnmtl/postfix

Then, if you had, say a Django app container that you wanted to be
able to send mail, you would link it with:

    $ docker run -P --link=postfix:postfix mydjangoapp

The environment variables `POSTFIX_PORT_25_TCP_ADDR` and
`POSTFIX_PORT_25_TCP_PORT` in your django container would then contain
the correct IP/port combo for in internal link to the postfix
container. So you would configure your django app to send SMTP
requests there.

This was inspired by
[catatnight/docker-postfix](https://github.com/catatnight/docker-postfix)
but we took out the TLS/OpenDKIM stuff and made it a bit simpler to
link.

