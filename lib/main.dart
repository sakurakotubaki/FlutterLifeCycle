import 'package:flutter/material.dart';
import 'package:lifecycle_app/dummy_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットは、アプリケーションのルートとなるものです
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これがあなたのアプリケーションのテーマです。
        //
        // "flutter run "でアプリケーションを実行してみてください。アプリケーションに青いツールバーがあるのがわかるでしょう。
        // アプリケーションに青いツールバーが表示されます。次に、アプリを終了させずに、以下を試してみてください。
        // 以下のprimarySwatchをColors.greenに変更してみてください。
        // "hot reload" を実行してください（"flutter run" を実行したコンソールで "r" を押してください。
        // または、Flutter IDEで "hot reload "するために変更を保存するだけです）。
        // カウンターがゼロにリセットされなかったことに注意してください。
        // アプリケーションは再起動されません。
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのトップページです。これはステートフルであり、つまり
  // このウィジェットは、State オブジェクト (以下で定義) を持っています。
  // どのように見えるかに影響するフィールドを含んでいます。

  // このクラスは、状態の設定です。このクラスは状態の設定です。
  // 親ウィジェット（この場合はアプリウィジェット）が提供する値（この場合はタイトル）と
  // State のビルドメソッドで使用されます。Widget サブクラス内のフィールドは
  // 常に "final" とマークされる。

  final String title;
  // createState
  // StatefulWidgetを構築する時に最初に呼ばれる。
  // stateオブジェクトを作成するために呼ばれる。
  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() {
    print("createStateが呼ばれた!");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print("setStateが呼ばれた!");
      // このsetStateの呼び出しは、Flutterフレームワークに、このStateに何か変更があったことを伝える。
      // これにより、以下のビルドメソッドを再実行し、ディスプレイに更新された値を反映させます。
      // 表示に更新された値を反映させるために、以下のビルドメソッドを再実行する。もし
      // setState() を呼び出さずに _counter を変更した場合、ビルドメソッドは再呼び出されないので
      // ビルドメソッドは再コールされないので、何も起こらないように見える。
      _counter++;
    });
    // カウンターを押すと画面遷移する.
    nextpage();
  }

  void nextpage() async {
    // ダミー画面へ遷移
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DummyPage();
    }));
  }

  // initState
  // Widgetツリーの初期化を行う。
  // 1度だけ呼ばれる。
  @override
  void initState() {
    super.initState();
    print("call initStateが呼ばれた!");
  }

  // didChangeDependencies
  // initStateの後に呼ばれる。
  // stateオブジェクトの依存関係が変更された時にも呼び出される。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("call didChangeDependenciesが呼ばれた!");
  }

  // build
  // Widgetで作られるUIを構築する。
  // ツリーの変更があった部分を検知して置き換える。
  @override
  Widget build(BuildContext context) {
    // このメソッドは setState が呼ばれるたびに再実行されます。
    // 上記の _incrementCounter メソッドによって実行されます。
    //
    // Flutter フレームワークは、ビルドメソッドの再実行を高速化するように最適化されています。
    // 更新が必要なものを個別に変更するのではなく、リビルドするだけで済むように、
    // Flutter フレームワークはビルドメソッドの再実行が高速になるように最適化されています。
    // ウィジェットのインスタンスを個別に変更するのではなく、更新が必要なものを再構築するだけです。
    return Scaffold(
      appBar: AppBar(
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取得します。
        // App.buildメソッドで作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Center はレイアウトウィジェットです。子プロセスを 1 つ受け取り、それを親の中央に配置します。
        // 親の中央に配置します。
        child: Column(
          // Column はレイアウトウィジェットでもあります。子プロセスのリストを受け取り
          // それらを縦に並べます。デフォルトでは
          // また、親と同じ高さになるようにします。
          //
          // 「デバッグペイント」を呼び出す（コンソールで「p」を押し、「デバッグペイントの切り替え」を選択する）。
          //Android StudioのFlutter Inspectorから
          // "Toggle Debug Paint "アクションを選択する。
          // コンソールで "p "を押す、Android StudioのFlutter Inspectorで "Toggle Debug Paint "アクションを選ぶ、またはVisual Studio Codeで "Toggle Debug Paint "コマンドを選ぶ）。
          // 各ウィジェットのワイヤーフレームを見るには
          //
          // カラムには、サイズや子ウィジェットの位置を制御するための様々なプロパティがあります。
          // 子ウィジェットをどのように配置するかを制御します。ここでは、mainAxisAlignment を使用しています。
          // ここでは、mainAxisAlignment を使用して、子ウィジェットを垂直方向に配置しています。
          // 列は垂直であるため、ここでの主軸は垂直軸です（横軸は
          // 水平）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '何度もボタンを押してるんだから:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは、ビルドメソッドの自動書式化を円滑にするものです。
    );
  }

  // deactivate
  // stateオブジェクトが削除されると呼び出される。
  @override
  void deactivate() {
    super.deactivate();
    print("call deactivateが呼ばれた!");
  }

  // dispose
  // オブジェクトが削除され、2度とビルドされない状態になった時に呼び出される。
  @override
  void dispose() {
    super.dispose();
    print("call disposeが呼ばれた!");
  }
}
