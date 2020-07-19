# FlokoROM OTA repo (and release script)

In order for a device to be officially supported by FlokoROM, OTA information needs to be added.

Please refer to the following "README" to get started

## 1. Introduction

In order for a device to be OTA compliant, there are a few things to know.

### 1.1 JSON structure

```json
{
  "response": [
    {
        "maintainer": "Name (nickname)",
        "oem": "OEM",
        "device": "Device Name",
        "filename": "Floko-v3.0-<device codename>-<date>-OFFICIAL.zip",
        "download": "https://sourceforge.net/projects/flokorom/files/v3/<device codename>/Floko-v3.0-<device codename>-<date>-OFFICIAL.zip/download",
        "timestamp": 0000000000,
        "md5": "abcdefg123456",
        "size": 123456789,
        "buildtype": "Official/Experimental/Unofficial",
        "forum": "https://forum link",
        "gapps": "https://gapps link",
        "firmware": "https://firmware link",
        "modem": "https://modem link",
        "bootloader": "https://bootloader link",
        "recovery": "https://recovery link",
        "paypal": "https://donation link",
        "telegram": "https://telegram or discord link"
    }
  ]
}
```

### 1.2 changelog.txt structure

```
Highlights & Device Specific Changes:
Build type: Official/Experimental/Unofficial
Device: Device name (<device codename>)
Device maintainer: Name (nickname)
Required firmware: add if any else remove this line

===== <date> =====
- change 1
- change 2
- change 3
```

## 2 Guidelines

* Check if manufacturer is already existing
* Check if published link is official
* Check if JSON is intact with help of online validator tools like [https://jsonformatter.curiousconcept.com](https://jsonformatter.curiousconcept.com) or [https://jsonformatter.org](https://jsonformatter.org)
* Check if no extra / missing spaces

## 3. How to

For following below description, replace `codename` with your device codename. 

### 3.1 Initial support

After you contacted [hota](https://github.com/FlokoROM/manifesto/wiki/How-to-official), and have the approval, follow the below steps.

1. Fork this repo to your own GitHub

2. Copy file `config.sh` from `config.sh.sample`

```sh
cp config.sh.sample config.sh
```

3. Open the file in a text editor (vim, nano, any GUI editor) and make changes from where it states *#modify values below*, save the file then run the upload script with below command

```sh
./release.sh <codename> /path/to/rom/like/Floko-v3.0-clover-20200713_063400-OFFICIAL.zip
```

4. A file named `codename.json` gets created in `device` folder in this repository.
5. Create a file named changelog_*codename*.txt based on changelog structure from point 1.2, and add your changelog in it.
6. Submit a pull request to this repo (this way we validate that you understood the requirements and if all is good you'll be granted direct push access to this repo)

### 3.2 Update build (after granted direct push)

1. Clone this repo locally

```
git clone https://github.com/FlokoROM/OTA -b 10.0
```

2. Change to the directory where you cloned this repo (OTA) and fetch updates from repo.

```
cd OTA
git fetch --all
git pull
```

3. Upload file and create new `codename.json` file (simply run `release.sh`)
4. Make changes to `changelog_codename.txt` and save it.
5. Now with the files updated, commit your update to this repo.

```
git add .
git commit # (this opens up your prefered text editor, so write a nice description like "<device codename>: update build")
git push # you may be prompted for your github username and password
```
