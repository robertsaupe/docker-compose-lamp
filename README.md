# docker-compose-lamp - lamp stack environment for developer

![screenshot](https://raw.githubusercontent.com/robertsaupe/docker-compose-lamp/master/.github/screenshot.png)

[Supporting](https://github.com/robertsaupe/docker-compose-lamp#supporting) |
[Features](https://github.com/robertsaupe/docker-compose-lamp#features) |
[License](https://github.com/robertsaupe/docker-compose-lamp#license) |
[Requirements](https://github.com/robertsaupe/docker-compose-lamp#requirements) |
[Installing](https://github.com/robertsaupe/docker-compose-lamp#installing) |
[Getting started](https://github.com/robertsaupe/docker-compose-lamp#getting-started) |
[Credits](https://github.com/robertsaupe/docker-compose-lamp#credits)

## Supporting
[Patreon](https://www.patreon.com/robertsaupe) |
[PayPal](https://www.paypal.com/donate?hosted_button_id=SQMRNY8YVPCZQ) |
[Amazon](https://www.amazon.de/ref=as_li_ss_tl?ie=UTF8&linkCode=ll2&tag=robertsaupe-21&linkId=b79bc86cee906816af515980cb1db95e&language=de_DE)

## Features
- Apache with SSL Support (http://localhost & https://localhost)
- PHP with XDebug (5.4.x, 5.6.x, 7.1.x, 7.2.x, 7.3.x, 7.4.x, 8.0.x)
- MySQL/MariaDB
- phpMyAdmin
- Redis

## License
This software is distributed under the MIT license. Please read [LICENSE](LICENSE) for information.

## Requirements
- docker
- docker-compose

## Installing

### Requirements
- Ubuntu/Debian
```
$ sudo apt install docker
$ sudo apt install docker-compose
```
- Arch/Manjaro
```
$ sudo pacman -S docker
$ sudo pacman -S docker-compose
```
- Fedora
```
$ sudo dnf install docker
$ sudo dnf install docker-compose
```

### Service
```
$ sudo systemctl start docker.service
$ sudo systemctl enable docker.service
```

### Run without root
```
$ sudo usermod -aG docker $USER
$ sudo reboot
```

### Environment
```
$ git clone https://github.com/robertsaupe/docker-compose-lamp.git
$ cd docker-compose-lamp/
$ cp sample.env .env
// modify .env as needed
$ docker-compose up -d
// visit http://localhost
```

## Getting started
to use http://app.local or http://projects.local, you have to modify your /etc/hosts
```
127.0.0.1  app.local
127.0.0.1  projects.local
```

## Credits
- https://github.com/sprintcube/docker-compose-lamp