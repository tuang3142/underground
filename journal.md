# progress

to-do list and, mainly, questions needed to be answers during the making of this project.

## todo

- pagy
- home dont need to be in static-pages
- seed db
- integration test?
- login with google (both?)
- css make it fit the center of the screen

## doing

- user model and user login
- session and cookies

## done

- display flash instead
- homepage
- make it sassy
- rspec

## side quests

- rakefile?
- config.ru?
- bin?
- yield?
- csrf meta tags
- csp meta tag
- application record read about it
- database index?
- write about bcrypt (digest, virtual attribute: pw and pw confirmation, authentication, how good it is?)
- no need specify link for user new?
- why is the name cookies?
- why store the digest of the token?

## diary

- no need factory for every project
- psql-cli's so cool
- authenticate allow checking user password is correct
- delete and restart. it will work.
- bootstrap for the win.
- ssl to prevent session hijacking
- http is stateless: independence
- render is not a redirect request, so flash persists
- session shorter than cookies, which does the same thing that store user info such as id
- consider session is a temporary cookie, expires immediately after browser close
- instead of storing the token, we store token digest. each time request with cookies is sent, we compare the digest
