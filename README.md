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
- Apache with vhosts and SSL (http://localhost & https://localhost)
- PHP (5.4.x, 5.6.x, 7.0.x, 7.1.x, 7.2.x, 7.3.x, 7.4.x, 8.0.x, 8.1.x)
- MySQL/MariaDB
- phpMyAdmin
- XDebug
- Imagick
- Redis

## License
This software is distributed under the MIT license. Please read [LICENSE](LICENSE) for information.

## Requirements
- docker
- docker-compose

## Installing

### German introduction / deutsche Einleitung
[blog.robertsaupe.de/docker-compose](https://blog.robertsaupe.de/docker-compose/)

### Requirements
- Debian/Ubuntu
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
- macOS
  - Install Docker Desktop according to [these instructions](https://docs.docker.com/desktop/mac/install/).

- Windows
  - Install Docker Desktop according to [these instructions](https://docs.docker.com/desktop/windows/install/).

### Service (Linux)
```
$ sudo systemctl start docker.service
$ sudo systemctl enable docker.service
```

### Run without root (Linux)
```
$ sudo usermod -aG docker $USER
$ sudo reboot
```

### Environment
```
$ git clone https://github.com/robertsaupe/docker-compose-lamp.git
$ cd docker-compose-lamp/
$ cp sample.env .env

### modify .env as needed

### builds and starts the environment:
./build.sh

### starts the environment:
./start.sh

### stops the environment:
./stop.sh
```

## Getting started

### Visit
- Dashboard
  - [http://localhost](http://localhost)

- phpMyAdmin
  - [http://localhost:8080](http://localhost:8080)

- virtual domains
  - [http://app.local](http://app.local)
  - [http://projects.local](http://projects.local)

In order to use the above URL, you still need to change the hosts file.

#### Linux/macOS
```
$ sudo nano /etc/hosts
```
#### Windows
You can just use Notepad for this. To do this, right-click on "Run as administrator" in the start menu. Then go to Open, show all files and navigate to the folder **C:\Windows\System32\drivers\etc**. Now you can open and edit the **hosts** file.

### hosts-file
```
...
127.0.0.1  app.local
127.0.0.1  projects.local
...
```

### Access to database
```php
<?php
//some before
$db_hostname="database";
//some after
?>
```

## Credits
- https://github.com/sprintcube/docker-compose-lamp