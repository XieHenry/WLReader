# WLReader
epub, txt reader, swift

## 功能概括

* html解析，采用DTCoreText库，包含对图片，链接等各种特殊标签的特殊定制样式，展示等
* epub,txt解析
* 翻页方式：仿真，平移，覆盖，无效果，滚动
* 字体，字号切换
* 背景色更换
* 长按选中
* 笔记划线
* 书签功能
* 书籍列表


### 使用方式

将demo中的WLReader拖入项目中，配置好Pofile依赖库：
```
  pod 'SnapKit'
  pod 'DTCoreText'
  pod 'SSZipArchive'
  pod 'AEXML'
  pod 'WCDB.swift'
```
执行pod install 即可

```
    @objc private func fastRead() {
        let path = Bundle.main.path(forResource: "xxx", ofType: "epub")
        let read = WLReadContainer()
        read.bookPath = path
        self.navigationController?.pushViewController(read, animated: true)
        
    }

```
demo中给出的是本地书籍解析，如果是网络书籍，可以自行处理下载逻辑，将下载之后的path给阅读主容器即可，解析和后续渲染一键完成
