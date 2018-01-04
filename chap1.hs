-- 関数プログラミング入門第1章
-- 定義を集めて文脈を与え、
-- 評価器はもっとも単純な形で評価を返す


-- 1.1.1
-- squareを用いてquadを定義
square, square' :: Float -> Float
square x = x * x
square' x = x ** 2

quad, quad' :: Float -> Float
quad x = square x * square x
quad' x = square $ square x

-- 1.1.2
-- 二つの引数のうち大きい方を返すgreaterを定義
greater, greater' :: (Ord a) => (a, a) -> a
greater (x, y) = if x >= y then x else y
greater' (x, y) = max x y

-- 1.1.3
-- 半径rの円の面積を計算（pi = 22 / 7 とする）
circle :: Float -> Float
circle r = p * square r where p = 22 / 7

-- 1.2.1
-- infinity * infinity の評価は停止するか否か->停止しない((*)演算しは引数を先に評価する)
three :: Integer -> Integer
three x = 3

infinity :: Integer
infinity = infinity + 1

-- three infinity = 3 （その方法があれば）必ず評価が停止するようになっている

-- 1.2.2
-- square (3 + 4) の簡約系列はいくつか？ => 2個?

-- 1.2.3
-- 以下のような式言語を定める
-- (i)  zeroは式である
-- (ii) eが式ならsucc(e),pred(e)も式である
-- (iii)-a succ (pred (e)) = e
-- (iii)-b pred (succ (e)) = e
-- succ (pred (succ (pred (pred (zero)))))を簡約化する
-- => pred (zero)

-- 1.2.4
-- さらに規則を追加
-- add (zero, e2) = e2
-- add (succ (e1), e2) = succ (add (e1, e2))
-- add (pred (e1), e2) = pred (add (e1, e2))
-- add (succ (pred (zero)), zero)を簡約化せよ
-- => zero
-- (和の交換則がないのでこの公理は不完全？[add (e1, zero) = ?]など)

-- 1.2.5
-- 式の大きさを次のように定義
-- size (zero) = 1
-- size (succ (e)) = 1 + size (e)
-- size (pred (e)) = 1 + size (e)
-- size (add (e1, e2)) = 1 + 2 * (size (e1) + size (e2))
-- 先に定義した簡約規則のどれを用いても式の大きさが小さくなることを示せ
-- これで簡約プロセスが必ず停止することを示したことになる、何故か

-- sizeは計算するだけ（略）
-- どんな式から簡約を始めても、式の大きさは変わらない（それ以上簡約できない）か小さくなる。
-- また、式の大きさが１より小さくなることはない。(任意の式は大きさ１であるzeroを用いて作られているため)
-- 以上より式の大きさは1以上の有限の値に落ち着く。つまり簡約プロセスは停止する。
