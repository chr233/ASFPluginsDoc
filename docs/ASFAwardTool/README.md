# ASF Award Tool

[![Bilibili](https://img.shields.io/badge/bilibili-Chr__-00A2D8.svg?logo=bilibili)](https://space.bilibili.com/5805394)
[![Steam](https://img.shields.io/badge/steam-Chr__-1B2838.svg?logo=steam)](https://steamcommunity.com/id/Chr_)

[![Steam](https://img.shields.io/badge/steam-donate-1B2838.svg?logo=steam)](https://steamcommunity.com/tradeoffer/new/?partner=221260487&token=xgqMgL-i)
[![爱发电][afdian_img]][afdian_link]
[![buy me a coffee][bmac_img]][bmac_link]

## EULA

> 请不要使用本插件来进行不受欢迎的行为, 包括但不限于: 刷好评, 发布广告 等.
>
> 详见 [插件配置说明](#插件配置说明)

## 安装方式

### 初次安装 / 手动更新

1. 从 [GitHub Releases](https://github.com/chr233/ASFAwardTool/releases) 下载插件的最新版本
2. 解压后将 `ASFAwardTool.dll` 丢进 `ArchiSteamFarm` 目录下的 `plugins` 文件夹
3. 重新启动 `ArchiSteamFarm` , 使用命令 `ASFAwardTool` 或 `AAT` 来检查插件是否正常工作

### ASFEnhance 联动

> 推荐搭配 [ASFEnhance](https://github.com/chr233/ASFEnhance) 使用, 可以通过 ASFEnhance 实现插件更新管理和禁用特定命令等功能

### 捐赠

|               ![img][afdian_qr]                |                   ![img][bmac_qr]                   |                       ![img][usdt_qr]                       |
| :--------------------------------------------: | :-------------------------------------------------: | :---------------------------------------------------------: |
| ![爱发电][afdian_img] <br> [链接][afdian_link] | ![buy me a coffee][bmac_img] <br> [链接][bmac_link] | ![USDT][usdt_img] <br> `TW41eecZ199QK6zujgKP4j1cz2bXzRus3c` |

[afdian_qr]: https://raw.chrxw.com/chr233/master/afadian_qr.png
[afdian_img]: https://img.shields.io/badge/爱发电-@chr__-ea4aaa.svg?logo=github-sponsors
[afdian_link]: https://afdian.net/@chr233
[bmac_qr]: https://raw.chrxw.com/chr233/master/bmc_qr.png
[bmac_img]: https://img.shields.io/badge/buy%20me%20a%20coffee-@chr233-yellow?logo=buymeacoffee
[bmac_link]: https://www.buymeacoffee.com/chr233
[usdt_qr]: https://raw.chrxw.com/chr233/master/usdt_qr.png
[usdt_img]: https://img.shields.io/badge/USDT-TRC20-2354e6.svg?logo=bitcoin

### 更新日志

| ASFAwardTool 版本                                                      | 适配 ASF 版本 | 更新说明   |
| ---------------------------------------------------------------------- | :-----------: | ---------- |
| [1.0.3.0](https://github.com/chr233/ASFAwardTool/releases/tag/1.0.3.0) |    6.0.2.6    | 第一个版本 |
| [1.0.2.0](https://github.com/chr233/ASFAwardTool/releases/tag/1.0.2.0) |    6.0.2.6    | 第一个版本 |

## 插件配置说明

> 本插件的配置不是必须的, 保持默认配置即可使用大部分功能

ASF.json

```json
{
  //ASF 配置
  "CurrentCulture": "...",
  "IPCPassword": "...",
  "...": "...",
  //Asf Award Tool 配置
  "ASFEnhance": {
    "EULA": true,
    "Statistic": true,
    "DisableFarming": false,
    "ThreadCount": 2,
    "ThreadExecutePeriod": 10,
    "PointCacheTTL": 10,
    "PreferBotPoints": 100000,
    "DelayPerAward": 300,
    "DelayPerAwardError": 2000,
    "DelayBeforeCalcAward": 2000,
    "DefaultExcludeReactions": [],
    "DefaultAwardType": "A",
    //下面的配置项仅服务器版有效
    "SyncServerTaskPeriod": 10,
    "AwardServer": "",
    "ClientId": ""
  }
}
```

| 配置项                    | 类型     | 默认值        | 说明                                                                              |
| ------------------------- | -------- | ------------- | --------------------------------------------------------------------------------- |
| `EULA`                    | `bool`   | `true`        | 是否同意 [EULA](#eula)                                                            |
| `Statistic`               | `bool`   | `true`        | 是否允许发送统计数据, 仅用于统计插件用户数量, 不会发送任何其他信息                |
| `DisableFarming`          | `bool`   | `false`       | 是否为所有机器人禁用挂卡功能                                                      |
| `ThreadCount`             | `int`    | `2`           | 打赏线程数量                                                                      |
| `ThreadExecutePeriod`     | `int`    | `10`          | 打赏线程运行任务的周期 (秒), 启动 ASF 30 秒后开始第一次执行, 设为 0 禁用          |
| `PointCacheTTL`           | `int`    | `10`          | 机器人点数缓存的有效期 (分钟), 在有效期内机器人不会自动刷新点数信息, 节约流量     |
| `PreferBotPoints`         | `long`   | `100000`      | 优先使用点数小于此设定值的机器人, 建议适当调大以免频繁切换机器人导致降低打赏速度  |
| `DelayPerAward`           | `int`    | `200`         | 发送一项打赏成功时的延时 (毫秒)                                                   |
| `DelayPerAwardError`      | `int`    | `2000`        | 发送一项打赏出错时的延时 (毫秒)                                                   |
| `DelayBeforeCalcAward`    | `int`    | `2000`        | 一个物品的打赏全部发送完成, 统计打赏数量前的延时 (毫秒), 此值太小会导致漏统计打赏 |
| `DefaultExcludeReactions` | `list`   | `null`        | 默认排除的打赏选项 Id 列表, 打赏选项说明见下                                      |
| `DefaultAwardType`        | `string` | `A`           | 默认打赏类型, 打赏类型说明见下                                                    |
| `UpdatePointCachePeriod`  | `int`    | `30`          | 在后台更新机器人点数周期 (秒), 设为 0 禁用                                        |
| `AutoMoveUnavilableBot`   | `bool`   | `false`       | 自动移动点数不足的机器人                                                          |
| `UnavilableBotDistPath`   | `string` | `config/bak/` | 点数不足的机器人配置文件移动到的目录                                              |
| 以下配置仅服务器版有效    | -        | -             | -                                                                                 |
| `SyncServerTaskPeriod`    | `int`    | `10`          | 同步服务器任务周期 (秒), 设为 0 禁用                                              |
| `AwardServer`             | `string` | `null`        | AwardServer 服务端地址                                                            |
| `ClientId`                | `guid`   | `null`        | 客户端识别码                                                                      |

- 打赏选项

  - 1: [300, '深思熟虑']
  - 2: [300, '暖人心脾']
  - 3: [300, '令人捧腹']
  - 4: [300, '惹火评论']
  - 5: [300, '诗意盎然']
  - 6: [300, '大有帮助']
  - 7: [300, '必须入手']
  - 8: [300, '米开朗基罗']
  - 9: [600, '神秘宝物']
  - 10: [1200, '惊奇发现']
  - 11: [2400, '金独角兽']
  - 12: [300, '奇思妙想']
  - 13: [2400, '聪明过人']
  - 14: [600, '温暖毛毯']
  - 15: [1200, '很皮很有味']
  - 16: [600, '缓缓鼓掌']
  - 17: [4800, '点数拿去']
  - 18: [300, '有益身心']
  - 19: [600, '小丑']
  - 20: [1200, '就是有范儿']
  - 21: [300, '哇哦']
  - 22: [600, '超级巨星']
  - 23: [300, '狂野不羁']

- 打赏类型 (不区分大小写)

  1. `A` 或 `*`: 打赏个人资料 指南 截图 评测 艺术作品 创意工坊
  2. `P`: 个人资料
  3. `G`: 指南
  4. `S`: 截图
  5. `R`: 评测
  6. `I`: 艺术作品
  7. `W`: 创意工坊
  8. `V`: 视频

  打赏类型允许任意组合, 例如 `PGS` 代表打赏 个人资料 指南 和 截图

## 插件指令说明

> `[]` 代表可省略的参数

| 命令                                              | 缩写         | 权限            | 说明                                           |
| ------------------------------------------------- | ------------ | --------------- | ---------------------------------------------- |
| `ASFAWARDTOOL`                                    | `AAT`        | `FamilySharing` | 查看 ASF Award Tool 的版本                     |
| `BOTPOINTS`                                       | `BOTPOINT`   | `Master`        | 查看所有机器人点数信息, 仅显示点数不足的机器人 |
| `BOTPOINTSDETAIL`                                 | `BOTPOINTSD` | `Master`        | 查看所有机器人点数信息, 显示所有机器人点数信息 |
| `BOTPOINTDETAIL`                                  | `BOTPOINTD`  | `Master`        | 同 `BOTPOINTSDETAIL`                           |
| `TASKLIST [任务ID/SteamID]`                       |              | `Master`        | 查找相关的打赏任务, 不指定参数时查显示所有任务 |
| `CREATETASK 被打赏人SteamdId 打赏点数 [打赏类型]` | `ADDTASK`    | `Master`        | 创建打赏任务, 打赏类型省略时使用默认打赏类型   |
| `CANCELTASK [任务ID/SteamID]`                     | `STOPTASK`   | `Master`        | 取消相关的打赏任务                             |
| `DELETEHISTORYTASK`                               | `DELHISTORY` | `Master`        | 清除历史任务记录                               |

## ASF.json 模板

```json
{
  "IPCPassword": "",
  "CurrentCulture": "zh-CN",
  "InventoryLimiterDelay": 5,
  "MaxTradeHoldDuration": 1,
  "SteamMessagePrefix": null,
  "UpdatePeriod": 0,
  "Headless": true,
  "ASFEnhance": {
    "EULA": true,
    "Statistic": true,
    "DevFeature": true,
    "DisabledCmds": [],
    "DisableFarming": true,
    "ThreadCount": 5,
    "PointCacheTTL": 1,
    "DelayPerAward": 100,
    "DelayPerAwardError": 1000,
    "UpdatePointCachePeriod": 30,
    "AutoMoveUnavilableBot": true,
    "UnavilableBotDist": null,
    "SyncServerTaskPeriod": 30,
    "AwardServer": "http://127.0.0.1:7600",
    "ClientId": ""
  }
}
```

## Nginx 伪静态配置

```config
	location ~* /Api/NLog {
		proxy_pass http://127.0.0.1:1242;

		# Only if you need to override default host
#		proxy_set_header Host 127.0.0.1;

		# X-headers should always be specified when proxying requests to ASF
		# They're crucial for proper identification of original IP, allowing ASF to e.g. ban the actual offenders instead of your nginx server
		# Specifying them allows ASF to properly resolve IP addresses of users making requests - making nginx work as a reverse proxy
		# Not specifying them will cause ASF to treat your nginx as the client - nginx will act as a traditional proxy in this case
		# If you're unable to host nginx service on the same machine as ASF, you most likely want to set KnownNetworks appropriately in addition to those
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Host $host:$server_port;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header X-Forwarded-Server $host;

		# We add those 3 extra options for websockets proxying, see https://nginx.org/en/docs/http/websocket.html
		proxy_http_version 1.1;
		proxy_set_header Connection "Upgrade";
		proxy_set_header Upgrade $http_upgrade;
	}

	location / {
		proxy_pass http://127.0.0.1:1242;

		# Only if you need to override default host
#		proxy_set_header Host 127.0.0.1;

		# X-headers should always be specified when proxying requests to ASF
		# They're crucial for proper identification of original IP, allowing ASF to e.g. ban the actual offenders instead of your nginx server
		# Specifying them allows ASF to properly resolve IP addresses of users making requests - making nginx work as a reverse proxy
		# Not specifying them will cause ASF to treat your nginx as the client - nginx will act as a traditional proxy in this case
		# If you're unable to host nginx service on the same machine as ASF, you most likely want to set KnownNetworks appropriately in addition to those
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Host $host:$server_port;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header X-Forwarded-Server $host;
	}
```

