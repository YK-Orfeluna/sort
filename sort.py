# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd


### Pythonのバージョンに合わせたtkinterのimport
import sys
v = sys.version_info[0]
if v == 2 :
	import Tkinter
	import tkMessageBox
	import tkFileDialog
elif v == 3 :
	import tkinter as Tkinter
	from tkinter import messagebox as tkMessageBox
	from tkinter import filedialog as tkFileDialog
else :
	exit("*This script only supports Python2.x or 3.x.\nSorry, we can not support your Python.")


### GUI用のおまじない
root = Tkinter.Tk()
root.option_add('*font', ('FixedSys', 14))
fTyp=[('csvファイル','*.csv')]
iDir='.'


### ファイル選択
lb=Tkinter.Label(root, text="Chose answer-file",width=20)
lb.pack()

answer_filename = tkFileDialog.askopenfilename(filetypes=fTyp,initialdir=iDir)
lb.configure(text="Chose order-file")

order_filename = tkFileDialog.askopenfilename(filetypes=fTyp,initialdir=iDir)

if answer_filename == "" or order_filename == "" :
	exit("*You did not chose your csv files")
else :
	print("*answer file is %s" %answer_filename)
	print("*order file is %s" %order_filename)


### csv読み込みとデータ取得
answer_data = pd.read_csv(answer_filename)
answer = answer_data.values
index = answer_data.index
header = answer_data.columns

print("Number of subjects is %s" %index.values.shape[0])
print("Number of conditions is %s" %header.values.shape[0])

order_data = pd.read_csv(order_filename)
order = order_data.values


### 並び替え
sort_index = np.argsort(order)
out = np.array([answer[0,sort_index[0,:]],answer[1,sort_index[1,:]]])


### 出力
df = pd.DataFrame(out, index=index, columns=header)

outname = "out.csv"
df.to_csv(df)
print("*Output >>> " + outname)

exit("System Exit")