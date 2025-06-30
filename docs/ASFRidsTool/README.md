# ASF Rids Tool

狄拉克之海 模拟登录游戏

## 插件配置说明

### ASF.json

```json
{
  //ASF 配置
  "CurrentCulture": "...",
  "IPCPassword": "...",
  "...": "...",
  //ASFEnhance 配置
  "ASFEnhance": {
    "EULA": true,
    "Statistic": true,
    "GameServer": "http://52.81.151.186:7350"
  }
}
```

| 配置项       | 类型      | 默认值 | 说明                                                               |
| ------------ | --------- | ------ | ------------------------------------------------------------------ |
| `EULA`       | `bool`    | `true` | 是否同意 EULA                                                      |
| `Statistic`  | `bool`    | `true` | 是否允许发送统计数据, 仅用于统计插件用户数量, 不会发送任何其他信息 |
| `GameServer` | `string?` | `null` | 如果为 `null` 会设定为内置值: `http://52.81.151.186:7350`          |

## 插件指令说明

### 插件测试

| 命令          | 缩写  | 权限            | 说明                      |
| ------------- | ----- | --------------- | ------------------------- |
| `ASFRIDSTOOL` | `ART` | `FamilySharing` | 查看 ASF Rids Tool 的版本 |
| `TEST [Bots]` | -     | `Master`        | 模拟登录游戏              |

