# ASFTf2Purchase

[![GitHub Release](https://img.shields.io/github/v/release/chr233/ASFEnhance?logo=github)](https://github.com/chr233/ASFEnhance/releases)
[![GitHub Release](https://img.shields.io/github/v/release/chr233/ASFEnhance?include_prereleases&label=pre-release&logo=github)](https://github.com/chr233/ASFEnhance/releases)
![GitHub last commit](https://img.shields.io/github/last-commit/chr233/ASFEnhance?logo=github)

![GitHub Repo stars](https://img.shields.io/github/stars/chr233/ASFEnhance?logo=github)
[![GitHub Download](https://img.shields.io/github/downloads/chr233/ASFEnhance/total?logo=github)](https://img.shields.io/github/v/release/chr233/ASFEnhance)

[![Bilibili](https://img.shields.io/badge/bilibili-Chr__-00A2D8.svg?logo=bilibili)](https://space.bilibili.com/5805394)
[![Steam](https://img.shields.io/badge/steam-Chr__-1B2838.svg?logo=steam)](https://steamcommunity.com/id/Chr_)

[![Steam](https://img.shields.io/badge/steam-donate-1B2838.svg?logo=steam)](https://steamcommunity.com/tradeoffer/new/?partner=221260487&token=xgqMgL-i)
[![爱发电][afdian_img]][afdian_link]
[![buy me a coffee][bmac_img]][bmac_link]

[English Version](README.en.md) | [Русская Версия](README.ru.md)

## Install

1. 从 [GitHub Releases](https://github.com/chr233/ASFTf2Purchase/releases) 下载插件的最新版本
2. 解压后将 `ASFTf2Purchase.dll` 丢进 `ArchiSteamFarm` 目录下的 `plugins` 文件夹
3. 重新启动 `ArchiSteamFarm` , 使用命令 `ASFTf2Purchase` 或 `ASFP` 来检查插件是否正常工作

## Donate

|               ![img][afdian_qr]                |                   ![img][bmac_qr]                   |                       ![img][usdt_qr]                       |
| :--------------------------------------------: | :-------------------------------------------------: | :---------------------------------------------------------: |
| ![爱发电][afdian_img] <br> [链接][afdian_link] | ![buy me a coffee][bmac_img] <br> [链接][bmac_link] | ![USDT][usdt_img] <br> `TW41eecZ199QK6zujgKP4j1cz2bXzRus3c` |

[afdian_qr]: https://raw.chrxw.com/chr233/master/afadian_qr.png
[afdian_img]: https://img.shields.io/badge/爱发电-@chr__-ea4aaa.svg?logo=github-sponsors
[afdian_link]: https://afdian.com/@chr233
[bmac_qr]: https://raw.chrxw.com/chr233/master/bmc_qr.png
[bmac_img]: https://img.shields.io/badge/buy%20me%20a%20coffee-@chr233-yellow?logo=buymeacoffee
[bmac_link]: https://www.buymeacoffee.com/chr233
[usdt_qr]: https://raw.chrxw.com/chr233/master/usdt_qr.png
[usdt_img]: https://img.shields.io/badge/USDT-TRC20-2354e6.svg?logo=bitcoin

## Commands

| 命令                              | 缩写   | 权限            | 说明                 |
| --------------------------------- | ------ | --------------- | -------------------- |
| `ASFTF2`                          | `ASFT` | `FamilySharing` | 测试插件是否安装成功 |
| `UPDATETF2`                       | `UTF2` | `Operator`      | 更新物品列表缓存     |
| `QUERYTF2 <物品Id 或者 物品名称>` | `QTF2` | `Operator`      | 查询物品列表         |
| `BUYTF2 [Bots] <物品Id>`          | `BTF2` | `Operator`      | 购买指定物品         |
| `BUYTF2 [Bots] <物品Id*数量>`     | `BTF2` | `Operator`      | 购买多个指定物品     |

> BTF2 bot 5854 // 购买指定物品
> BTF2 bot 5854\*10 //购买 10 个指定物品

