# sort

## sort_processing
YSD氏作成のPrototype

## sort.py
sort_processingをPythonに置き換えたもの

Python2.x，Python3.xどちらも対応済み

### 必要環境
* Numpy
* Pandas

### 実行手順
1. スクリプトを起動する
2. ファイル選択画面が出てくるので，順番に「回答値のcsv」「順序交差のcsv」を選択する
3. 順序交差に従って並び替えられた回答値が「out.csv」として出力される

### 注意事項
* 読み込むcsvファイルはどちらも，headerとindex_colmunがある前提である
	* つまり，一番上の行はheader扱い，一番左の列はindex_column扱いとなる
* 読み込むcsvファイルの形式は，同じでなければいけない
	* 同じ形式のheaderとindex_columnであること
* 書き出しされるcsvファイルのheaderとindex_columnは並び替え前の回答値のcsvに依存する