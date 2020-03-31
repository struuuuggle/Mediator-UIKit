# Mediator
相手は相談役一人だけ

## どんなものか
コンポーネントが複雑に絡み合って相互に値をやり取りすることを避け、やり取りの経路が1 Mediator: N Componentsな実装を可能とする。
アプリ内の一時的な情報を一箇所にまとめておくReduxにおいてはStoreがMediatorといえるのでは？

## 登場人物
### Mediator(調停者)
Colleagueとやり取りを行うインターフェース
サンプルプログラムでは`BaseMediator`

## ConcreteMediator
Mediatorのインターフェースを実装するクラス
サンプルプログラムでは`LoginFrame`

### Colleague
Mediatorとやり取りを行うインターフェース
サンプルプログラムでは`BaseColleague`

### ConcreteColleague
Colleagueのインターフェースを実装するクラス
サンプルプログラムでは`ColleagueButton`、`ColleagueTextField`、`ColleagueCheckBox`

## どんなときに使うか
### 分散が災いとなるとき
コンポーネント同士で値を受け渡す実装は、多くのコンポーネントが密結合になってしまう。
Mediatorを適用するとコンポーネント同士の通信を避けることができるため、Componentに関するビジネスロジックは全てMediatorに記述できる。

### ビジネスロジックを再利用しないとき
Mediatorを使い回すことは困難。
Componentのドメインをはっきり分けた実装をすれば、各ドメインごとにMediatorを作ることが可能になりそう。
もちろんGlobal Mediatorのような概念で実装することも可能。
