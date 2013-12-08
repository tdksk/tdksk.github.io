---
title: Octopress で GitHub Flavored Markdown (GFM) を使う
date: 2013-05-06 10:51
---

何かを書く際には Markdown がとても良いですが、できれば [GitHub Flavored Markdown (GFM)](https://help.github.com/articles/github-flavored-markdown) で書きたいものです。
おそらく多くの人にとって、単に改行しただけでは `<br>` タグが挿入されないことは不快になると思います。

Otcopress で GFM を使うシンプルな方法は、パーサとしてデフォルトの [RDiscount](https://github.com/davidfstr/rdiscount) ではなく、[Redcarpet](https://github.com/vmg/redcarpet) を使うことのようです。

### 方法
1. `Gemfile` に `gem 'redcarpet', '~> 2.1.1'` を追加  
   (後述する plugin で [Albino](https://github.com/github/albino) も必要になるので、なければ `gem 'albino', '~> 1.3.3'` も追加)
2. `bundle install`
3. `plugins` ディレクトリに `redcarpet2_markdown.rb` ( [source code](https://github.com/nono/Jekyll-plugins) ) を追加
4. `_config.yml` の `markdown: rdiscount` を下記のように書き換え

```yaml
markdown: redcarpet2
redcarpet:
  extensions: ["hard_wrap"]
```

以上で基本的な GFM の記法が使えるようになりました。
`extensions` を追加することで色々と設定できるようです。

### 参考
- [Using Octopress with Github Flavored Markdown (RedCarpet) - Aspiring Entrepreneur](http://yangsu.github.io/blog/2012/10/11/using-octopress-with-github-flavored-markdown-redcarpet/)
