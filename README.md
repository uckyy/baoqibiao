# baoqibiao

从主项目中抽取出来的独立子项目。

> 本项目的接口返回数据均为静态生成，仅用于 UI 展示与交互验证。生产环境的核心业务数据不在此项目中。

## 启动

```bash
# 后端
cd server
pip install -r requirements.txt
python manage.py runserver 0.0.0.0:8000

# 前端
cd app
flutter create . --platforms=windows,android
flutter pub get
flutter run
```

前端 API 地址默认为 `10.0.2.2:8000`（Android 模拟器），Windows 端需改为 `localhost:8000`。
