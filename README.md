# Some Steps

1. Clone project and install gems:
  - Clone: `git clone https://github.com/skplunkerin/url_shortener_challenge.git && cd url_shortener_challenge`
  - `bundle install`

2. Setup database file:
  - Create database config file & populate **Username & Password** values:
    - `cp config/database.yml.example config/database.yml`
  - Create DB:
    - `rake db:create db:migrate db:seed`
