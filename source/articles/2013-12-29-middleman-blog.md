---
title: ブログシステムを Octopress から Middleman に移行した
date: 2013-12-29 19:45 JST
---

最近いくつか書きかけの文章ができたので久々にブログにでも投稿しようかなと思っていたのですが、すっかり [Octopress](http://octopress.org/) の作法を忘れてしまいやる気が削がれている状態が続いていました。
デザインもどこかで拾ってきたテンプレートそのままで投稿するモチベーションが湧かないし、一念発起してブログシステムを [Middleman](http://middlemanapp.com/) で置き換えました。

## Middleman
なんで Middleman にしたかというのは最近流行っていそうというだけの理由だったのですが、実際使ってみてだいぶ好きになりました。

Octopress の嫌なところは、Jekyll に対して外から見える形でコードを乗せすぎている部分でした。ある意味 WordPress を彷彿とさせるあの感じはなかなか受け入れ難かったです。
一方 Middleman でブログを作ろうとすると、middleman-blog という公式の拡張を使うことになるのですが、Middleman に最低限の機能だけ乗せた感じがすっきりしていて良いです。

Jekyll と Middleman の比較という意味だと Jekyll を使ったことないのでよく分からないのですが、Middleman のほうが後発ということもあり洗練されてる感じがするし、便利な拡張が多い気がします。

## 静的サイトジェネレータ
Middleman のようないわゆる静的サイトジェネレータの良い部分っていうのは、サーバサイドに精通しているエンジニアよりもフロント寄りの人のほうが実感することができると思います。
フロント寄りの人にとっても Asset Pipeline のような仕組みはぜひとも使いたいのですが、意外とサーバサイドの実装はいらないことも多いので、そういう場合は Rails や Sinatra を使うまでもない。その点 Middleman は必要十分な機能を備えていてかつシンプルなのでフロント寄りの人にとっても分かりやすい。

いわゆる一般的な Web アプリケーションエンジニアにとっては、Middleman は Sinatra の一部を抜き出しただけという印象を受けるかもしれませんが、その「一部」を選び、かつ少し味付けすることで全く違う性質のプロダクトになっているのが本質だと思いました。

## 感じたこと
今回 Middleman を使ってみて、ある分野で当たり前だったことが他の分野でも当たり前であるということは必ずしもありえず、取捨選択して他の分野に適用すればそれだけで世界が広がるということはありえそうだなという感触を持つことができました。これからは今まで以上に分野間（エンジニアリングとデザイン、ソフトウェアとハードウェアなど）の垣根が下がっていくはずなので、様々な分野のことを知っておくのは良いことだと思いますし、分野を問わず便利なツールはどんどん試していきたいです。
