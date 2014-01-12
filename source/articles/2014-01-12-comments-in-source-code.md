---
title: ソースコードのコメントの書き方を整える利点
date: 2014-01-12 16:02 JST
---

- [Ned Batchelder: Comments should be sentences](http://nedbatchelder.com/blog/201401/comments_should_be_sentences.html)

ソースコードでのコメントの書き方について、具体的な方法論を述べている記事です。

こういうものは些細なことというか本質的ではないことと捉えられがちですが、この記事ではちゃんとその辺りも言及していて良いなと思いました。

> Many coders will look at this advice and complain that it is way too nit-picking, that punctuation in comments is irrelevant, that since it's natural language, it's readable as it is, we don't have to worry about trivialities like punctuation they are wrong text needs punctuation to be readable leaving it out just makes it hard to parse the sentences see what i did there?

そして一番重要なことは最後の方に書かれていました。

> One last reason for full sentences: the programming variant of the broken windows theory says that if you take care of small things, others are more likely to take care of the bigger things. Polished code is more likely to be maintained well and will set the tone for more polished code in the future.

これはたしかに自分の浅い経験と照らしあわせてもなるほどなと思える理由でした。

コードレビューをするという観点からみると、些細なことはレギュレーションをかけることにより、見る側の負担を減らしてもっと重要な本質的な部分に対して言及しやすくなるのかなと思いました。書く側としても、フォーマットなどはルールを明確にすることでストレスを減らすことができそうです（書き方とかを気にする人は結構いる気がしています）。このあたりはコメントの書き方というよりもコーディングルール全般の話になると思うのですが、コーディングルールを決めることとコメントの書き方を考えることは似たような目的だと思うので、コーディングルールにコメントのフォーマットに関するルールも含めてしまうのが良いのかもしれませんね。
