# ASFCsgoTransfer

[![Bilibili](https://img.shields.io/badge/bilibili-Chr__-00A2D8.svg?logo=bilibili)](https://space.bilibili.com/5805394)
[![Steam](https://img.shields.io/badge/steam-Chr__-1B2838.svg?logo=steam)](https://steamcommunity.com/id/Chr_)

[![Steam](https://img.shields.io/badge/steam-donate-1B2838.svg?logo=steam)](https://steamcommunity.com/tradeoffer/new/?partner=221260487&token=xgqMgL-i)
[![爱发电](https://img.shields.io/badge/爱发电-chr__-ea4aaa.svg?logo=github-sponsors)](https://afdian.net/@chr233)

## 安装方式

### 初次安装 / 手动更新

1. 从 [GitHub Releases](https://github.com/chr233/ASFCsgoTransfer/releases) 下载插件的最新版本
2. 解压后将 `ASFCsgoTransfer.dll` 丢进 `ArchiSteamFarm` 目录下的 `plugins` 文件夹
3. 重新启动 `ArchiSteamFarm` , 使用命令来检查插件是否正常工作

### 功能指令

| 命令                               | 缩写  | 权限     | 说明                         |
| ---------------------------------- | ----- | -------- | ---------------------------- |
| `TRANSFERCSGO Bot 交易链接 [模式]` | `TRC` | `Master` | 发送 CSGO 物品到指定交易链接 |

可选模式:

| 参数      | 类型                   |
| --------- | ---------------------- |
| `CASE`    | 武器箱 (默认)          |
| `WEAPON`  | 武器皮肤               |
| `MUSIC`   | 音乐盒                 |
| `TOOL`    | 工具 (命名牌等)        |
| `COLLECT` | 收藏品 (徽章等)        |
| `PLAYER`  | 干员                   |
| `OTHER`   | 其他                   |
| `ALL`     | 除了 `其他` 的所有类型 |

