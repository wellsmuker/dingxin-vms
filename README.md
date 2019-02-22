# Dingxin::Vms
### 鼎信科技-语音通知服务 Ruby Gem dingxin-vms

## 使用前提

使用 dingxin-vms 前，您必须已经是阿里云注册用户，申请开通了“鼎信科技_语音通知API服务
”，并且获得了以下关键参数: 

AppCode: 阿里云应用密钥。

## Installation 安装

### Ruby 通用安装方法
在命令行中输入命令（电脑已经安装 gems 命令行工具）

```ruby
gem install dingxin-vms
```

### Rails 应用安装方法

在应用的 Gemfile 文件中添加 Ruby Gems 安装源:

```ruby
gem 'dingxin-vms'   # Ruby Gems 安装源
```

应用的根目录下运行:

```ruby
bundle
```

### 下载后安装

使用 Git 将代码克隆到本地后使用 Rake 命令安装

```bash
git clone https://github.com/kejincan0527/dingxin-vms.git

cd dingxin-vms

rake build

rake install
```

### 安装可能遇到的问题及其解决方式  

安装后，如果在 irb 命令行输入命令

```ruby
require 'dingxin/vms'
```

后，无法正确获取 Gem 引用，或者在 Rails 启动时报错提示如下: 

> ./config/initializers/dingxin-vms.rb:1:in `<top (required)>': uninitialized constant Dingxin::Vms (NameError)

可以改为 Github 安装源，例如 Rails Gemfile 文件引用可以改为下面格式，即可正确安装。

```ruby
gem 'dingxin-vms', '0.0.1', git: 'https://github.com/kejincan0527/dingxin-vms.git'
```

## Usage 使用

### Ruby 程序通用方法（irb命令行示例）

#### 第一步: 

```bash
$ require 'dingxin/vms'
```

```bash
=> true
```

#### 第二步: 

参数设置: 

```ruby
> Dingxin::Vms.configure do |config|
    config.app_code = APP_CODE    # 阿里云应用密钥，在阿里云控制台获取
  end

```
返回

```ruby
  => "67hbft5iouyhnjkio975rfh"
```

#### 第三步: 

发送语音: 

    $ Dingxin::Vms.send(phone, tpl_id, param)

参数说明: 

1. phone:    接收语音的手机号，必须为字符型，例如 '057112345678'；
2. tpl\_id:  语音模板id，必须为字符型，联系客服人员申请；
3. param:    请求字符串，向语音模版提供参数，例如 'asin:B01E7LLKT2'；

### Rails 应用使用方法

#### 第一步: 

在 Rails 应用目录 config/initializers/ 下创建脚本文件 dingxin-vms.rb，在文件中加入以下内容: 

config/initializers/dingxin-vms.rb

```ruby
Dingxin::Vms.configure do |config|
  config.app_code = APP_CODE    # 阿里云应用密钥，在阿里云控制台获取
end
```
之后，重新启动 Rails，加载配置。

#### 第二步: 

在 Rails 应用中调用语音发送代码: 

```ruby
...
phone = '15912345678'
tpl_id = 'TP18031516'
param = 'asin:B01E7LLKT2'
Dingxin::Vms.send(phone, tpl_id, param)
...
```

## Development 开发

按照阿里云市场[鼎信科技官方接口文档](https://market.aliyun.com/products/56928004/cmapi026600.html)提供的 VMS 样例做了 spect 测试，可以 clone 项目后，在根目录下用命令行运行以下命令测试: 

    $ bundle exec rspec spec


## License 许可

MIT 协议下的开源项目。 [MIT License](http://opensource.org/licenses/MIT).
