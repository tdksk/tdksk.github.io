---
title: インタラクション時代における iOS アプリの戻る（閉じる）操作の種類のまとめ 2014年版
date: 2014-12-31 22:40 JST
---

## 背景

iPhone も年々デバイスサイズが大きくなっていき、左上のナビゲーションバー上のボタンを片手で押すことが困難になってきました。そのような時代においてはスワイプジェスチャーによるナビゲーション操作が今まで以上に重要になってきます。また、最近では情報の階層を分かりやすく表現するためにトランジションもどんどん工夫されています。トランジションが複雑になればなるほどその操作も複雑になるため、分かりやすさと使いやすさを両立するためにインタラクションを工夫する必要があります。

そんな2014年の終わりとして現時点での情報閲覧系 iOS アプリでの戻る（閉じる）操作の種類をまとめてみました。

## 遷移（Push）時のトランジションがデフォルト（新しい画面が右から左に出てくる）

### Screen Edge Swipe（デフォルトの Pop トランジション）

デフォルトの Push トランジションで遷移した画面は、画面左端を右方向にスワイプすることで戻ることができる。最も無難な選択肢で、中途半端なカスタムトランジションを作るくらいなら Push も Pop もデフォルトのトランジションにするのが分かりやすいし操作もしやすい。

- Apple 純正アプリ
- Tumblr
- Coach.me
- Basecamp
- Google (WebView)
- The New York Times
- BuzzFeed
- LINE
- Wantedly
- Sumally

### Screen Edge Swipe が有効だが、スクロール時には無効

デフォルトの Screen Edge Swipe のジェスチャー検出はスクロール時にも行われるため、左手で操作している人だと上方向にスクロールしている時に意図せず Screen Edge Swipe となり画面が戻ることがあるという問題もある。そのためかいくつかのアプリではスクロール時は Screen Edge Swipe を無効化しているものがある。

実装参考：[iOS - UINavigationControllerのinteractivePopGestureRecognizerの感度を調整する - Qiita](http://qiita.com/inamiy/items/fa91da40d0da53123a83)

- Facebook
- Twitter
- Airbnb
- Foursquare
- Yelp
- Evernote
- Vine
- Product Hunt
- 755

### Screen Edge Swipe 無効

Screen Edge Swipe で戻る動作が無効になっているものもある。通常の Push トランジションのような遷移の場合は、基本的に無効化するべきでない。Google のアプリは頑なに有効化しないイメージ。

- Gmail
- Google Chrome
- Gogobot
- SideChef
- Medium
- WEAR
- 食べログ

### Sloppy Swiping

今年頭に [Josh Ginter がブログで提唱した](http://thenewsprint.co/2014/04/16/sloppy-swiping/) 言葉（その後 [Jared Sinclair も詳しく言及している](http://blog.jaredsinclair.com/post/83544603052/sloppy-swiping-how-to-make-an-app-feel)）。画面端という特定の場所だけでなく、画面内の任意の場所でのスワイプのことを指す。

Sloppy Swiping で戻る操作はとてもやりやすく強力なアプローチだが、これを有効にするとその他のスワイプジェスチャーを殺さざるをえないという諸刃の剣。Reeder 2 は戻るだけでなく進む動作も Sloppy Swiping で可能でこれ自体はとても良いが、セルの部分をスワイプすると別の挙動になったり、WebView では Sloppy Swiping が有効でなくなったりしているため一貫性がなく全体としてあまり良いとはいえない。Sloppy Swiping で戻る動作を有効にするなら、アプリ内全てで一貫して（どの画面、どの位置でも）この操作が有効になるようにするべき。Instagram はとても良くできていて使っていて気持ちが良い。

実装参考：[fastred/SloppySwiper](https://github.com/fastred/SloppySwiper)、[A-Liaison BLOG: UINavigationController.interactivePopGestureRecognizer の挙動を魔改造して変えてみる](http://akisute.com/2014/08/uinavigationcontrollerinteractivepopges.html)

- Instagram
- Wunderlist
- Unread
- Tinder（メッセージ画面）
- Flipboard
  - 加速度が大きいと指を離さなくても遷移
- Reeder 2
  - セル部分は別の挙動

### 指の動きについてこない Sloppy Swiping

UI 的には上記のものの下位互換。指を一定距離動かすか離すまで画面が何も変化しない（アフォーダンスが発生しない）ので学習コストが高い上に使っていて気持ちが悪い。特別な理由がなければ指の動きに合わせて画面が動くようにするべき。

- Instapaper
- Sunrise
- Yummly
- クックパッド
- NewsPicks
- Gunosy
- SmartNews
  - トランジションが特殊

## 遷移（Push）時のトランジションが特殊

### Screen Edge Swipe で戻るときはデフォルトの Pop トランジション

最近では Push 時のトランジションが、対象がズームするもしくは中身が広がるようなものが増えた（[Material Design でも採用されている](http://www.google.com/design/spec/patterns/navigational-transitions.html#navigational-transitions-parent-to-child)）。ナビゲーションバーの戻る（閉じる）ボタンを押すと逆のトランジションで戻るが、利便性を考えてか Screen Edge Swipe でデフォルトの Pop トランジションで戻ることのできるものが多い。トランジションの一貫性はないものの、戻るときの操作自体には違和感が少ないという利点がある。

- Snapguide
- Sosh
- Play Newsstand
- Pinterest
  - 上から下に引っ張って離しても戻る
- Facebook Groups
  - 上から下に引っ張って離しても戻る

### Screen Edge Swipe で戻るときがその逆のトランジション

上と同じような特殊トランジションをするが、Screen Edge Swipe で通常の Pop トランジションではなく特殊トランジションとなる。Push 時のトランジションの逆のトランジションになるので迷いにくく、かつトランジションが指の動きについてくるので操作の気持ちよさはあるものの、そのトランジションが必ずしも左から右への動作と感覚的に一致するものとは限らないので分かりにくいかも。

- Design Shots
- Evernote（Notebooks や Tags 開閉）
- iQON
  - スクロール後はデフォルト Pop トランジションで戻る

### 左端からスワイプした瞬間にトランジション

スワイプジェスチャーが検出された瞬間にトランジションが発動するものもいくつか存在する。指の動きについてこず気持ち悪いため、上のような実装にするほうがベターな感じはする。とはいえ、戻るためにボタンを押す以外の選択肢を与えないよりは良い。

- Yahoo News Digest
- Fancy
- Spring
  - 上から下に引っ張って離しても戻る
- Simplenote

### Sloppy Swiping で上から下に引っ張って離すと戻る

ズームもしくは中身が広がるようなトランジションの場合、上から下に引っ張る動作で戻ることができるものも多い。上下にスクロールするような画面の場合、一番上まで戻った時にさらにスクロールすると前の画面に戻るというのはある意味自然なのかもしれない。感覚としても上から下に引っ張って離した時に縮小したりするトランジションは違和感が少ない。

Facebook Paper はトランジションの種類が多いが、トランジションに合わせてどこかしらに Sloppy Swiping すると戻る挙動になっていて使いやすさを保っていてすごい。Storehouse は上下左右どの方向にスワイプしても縮小して戻ることができてすごい（このアプリは動きが独特で水の中にいるような錯覚を覚える）。

- Spring
  - Screen Edge Swipe した瞬間にもトランジション発火
- Pinterest
  - Screen Edge Swipe でデフォルト Pop トランジションで戻る
- Facebook Groups
  - Screen Edge Swipe でデフォルト Pop トランジションで戻る
- Google
- YouTube
  - 縮小されて右下にとどまる
- Facebook Paper（通常のカード）
  - トランジション中のジェスチャーも妨げない
- Siori（コメントポップアップ）
- Facebook（コメントポップアップ）
- Facebook Paper（コメントポップアップ）
  - 下から上に引っ張っても戻る
- Inbox
  - 下から上に引っ張っても戻る
- Antenna（WebView）
  - 下から上に引っ張っても戻る
- Facebook Paper（WebView）
  - 左端、右端からスワイプでも戻る
- Storehouse
  - 上下左右どこへ引っ張っても戻る

## まとめ

どれがベスト、というものはありません。分かりやすく使いやすく、更には使っていて気持ちの良いインタラクションを提供するために、頑張る余地はまだまだたくさん残っていそうです。
