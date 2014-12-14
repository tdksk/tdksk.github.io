---
title: Auto Layout で n 等分するセパレータようなものを配置する
date: 2014-12-14 13:35 JST
---

![20141106023758_0336a8bba51cf548f8ef5fe87fb303ed6ef3a335](https://cloud.githubusercontent.com/assets/2177378/5426452/8f6d7b4c-8395-11e4-96b2-9d54bae1e4ef.png)

iOS アプリにおいて、↑のように View を n 等分するようにセパレータをつけたいという箇所がでてきました。

調べたら [ここ](http://mathewsanders.com/designing-adaptive-layouts-for-iphone-6-plus/#spacer-view-example) に書いてありました。この記事は分かりやすいので見ればすぐ分かると思うのですが折角なので簡単に説明します。

![20141106023837_eed875da5706139c500323f07486d1917b31d77f](https://cloud.githubusercontent.com/assets/2177378/5426456/93f4334a-8395-11e4-9dec-5bef0694133a.png)

まずセパレータの間にそれぞれ見えない（hidden プロパティが true になっている）View を追加します。

![20141106023852_4dace227f4c068a061ebabfd4589b36903376f76](https://cloud.githubusercontent.com/assets/2177378/5426458/983c8d76-8395-11e4-9da6-a77279041cae.png)

あとはその見えない View を大枠となる View やセパレータとぴったりくっつくように（Horizontal Space を 0 に）して、見えない View すべてに Equal Width を適用します。セパレータの幅は固定幅で適当に決めれば良いです。
