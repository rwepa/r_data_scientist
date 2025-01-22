"""
Title:  : 第4章 Python-數據的整合、清理與轉換
File    : python_training_2025.01.22_pandas_matplotlib.py
Author  : Ming-Chang Lee
Date    : 2025.01.22
YouTube : https://www.youtube.com/@alan9956
RWEPA   : http://rwepa.blogspot.tw/
GitHub  : https://github.com/rwepa
Email   : alan9956@gmail.com
"""

# 😀大綱💞

# 01.字串與格式化處理
# 02.正規表示式
# 03.pandas模組簡介
# 04.將AQI資料集改為Python pandas操作
# 05.matplotlib, seaborn, pandas, plotnine 模組視覺化應用
# 06.行銷案例應用

##############################
# 01.字串與格式化處理
##############################

# 字串輸入 input

# input-範例1
name = input("keyin your name?")
print(name)
type(name) # str

# input-範例2
mynumbers = input("輸入2個數值, 中間使用逗號區隔, 計算2個數值相加結果?")
print(mynumbers)
type(mynumbers)
len(mynumbers)

# 思考題: 如何計算逗號區隔的二個數值加總

# 字串(String)由一個(以上)字元所組成
# 字串左右二側須使用單引號或是雙引號

# 字串物件 https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
# 字串方法 https://docs.python.org/3/library/string.html

city = '台北市'
district = '信義區'
road = '信義路五段7號'

# 使用 + 字串串接
city + district

address = city + district + road
print(address)

# 數值轉換為字串
myinteger = 123
mystr = str(myinteger)
mystr
type(mystr)

# 字串轉換為數值
mystr = "123.456"
myvalue = float(mystr)
myvalue
type(myvalue)

# 字串指標存取
address       # '台北市,信義區,信義路五段7號'
address[0]    # '台'
address[-1]   # '號'
address[8:13] # '信義路五段'

# 使用 * 建立重複字串
city   # '台北市'
5*city
city*5

# len 長度
len(address) # 15

# 字串分割 – split
# str.split(sep=None, maxsplit=-1)
# 預設分割 sep 為空白字元, maxsplit=-1 表示沒分割次數限制

address = city + ',' + district + ',' + road
address
address.split(',') # 預設分割字元為空白字元
address.split(',',  maxsplit = 1) # 預設分割字元為空白字元

# 實作練習1
# 練習 mynumbers 字串分割為二個數值並計算數值加總.

# 字串結合 - join

city = "台北市"
district = "信義區"
road = "信義路五段7號"
str1 = city + district + road
str1

''.join([city, district, road])

'-'.join([city, district, road])

mytuple = ("台北市", "信義區", "信義路五段7號")
"".join(mytuple) # 將3個元素,合併為一個元素.
           
# 字串 if in (if not in)
txt = "One of the world's strictest lockdowns is lifting, but many are scared to go back to normal life."

if "scared" in txt:
    print("Find 'scared'") # 完全比對
    
if "scare" in txt:
    print("Find 'scare'")  # 部分字串相同
    
if "Scare" in txt:
    print("Find 'Scare'")  # 區分大小寫

# 刪除左側或右側空白字元 strip (中間的字元不會刪除) 
# 刪除左側空白字元 lstrip 
# 刪除右側空白字元 rstrip
x = " RWEPA - Python 大數據分析\n "

x.strip()  # \n 視為空白字元而加以刪除
x.lstrip()
x.rstrip()

import string
string.whitespace # ' \t\n\r\x0b\x0c' \x0b:印表機垂直定位符號, \x0c:換頁符號

x.strip("Python") # 中間字元會保留
"Python大數據分析Python".strip("python") # 有區分大小寫
"Python大數據分析Python".strip("Python") # 有區分大小寫
"Python大數據分析Python".lstrip("python")
"Python大數據分析Python".rstrip("python")

# 字串判斷 str.isxxx
"123".isdigit()                # 數字digits包括 '0123456789'
"123".isalpha()                # 數字不是英文字母
"alan9956".isalpha()           # 英文加數字不是英文字母
"alan9956".isdigit()           # 英文加數字不是數字
"!@#$%^&*()[]{}\|".isascii()   # 半型符號是ASCII
"おはようございます".isascii()   # 日本字不是ASCII
"大數據分析".isascii()          # 中文字不是ASCII
"RWEPA".isupper()              # 大寫英文字母
"alan9956@gmail.com".islower() # 小寫英文字母

# 實作練習2
# 計算 mystr 字串中, 不區分大小寫, 英文字母出前次數最多的前6名為何?
mystr = 'Scikit-learn is an Open source Machine Learning library that supports supervised and unsupervised learning.'
# 技巧: 使用 collections.Counter 方法
# 答案為 n, e, i, r, s, a

# 字串的搜尋
# find 回傳字串的索引, 找不到回傳-1
mystr.find('Learning') # 39
mystr.find('bigdata') # -1

mystr.index('learn') # 7
mystr.index('bigdata') # ValueError: substring not found

for x in mystr:
    print(x)

# rfind 從最後面查詢
mystr.rfind('learning') # 98

# 字串取代 - replace
address = '台北市,信義區,信義路五段7號'
address.replace(',', '*') # '台北市*信義區*信義路五段7號'

# 字串格式化 - 4種方式

# 字串格式化 方法1. 早期使用 %, 與 C 語言 的 printf 類似
text = 'world'
print('Hello %s' % text) # Hello world

# 字串格式化 方法2. str.format 函數

# 1個參數
year = 2021
txt = "我的名字是 Alan, 現在是 {} 年"
print(txt.format(year)) # 我的名字是 Alan, 現在是 2021 年

# 多個參數
quantity = 1
item = "美國Blue Yeti 雪怪 USB麥克風"
price = 5590

myorder = "感謝您訂購-->產品名稱: {}, 數量: {}, 價格: {} 元"
print(myorder.format(item, quantity, price))
# 感謝您訂購-->產品名稱: 美國Blue Yeti 雪怪 USB麥克風, 數量: 1, 價格: 5590 元

# 多個參數-使用指標
quantity = 1
item = "美國Blue Yeti 雪怪 USB麥克風"
price = 5590

myorder = "感謝您訂購-->數量: {1}, 產品名稱: {0}, 價格: {2} 元"
print(myorder.format(item, quantity, price))
# 感謝您訂購-->數量: 1, 產品名稱: 美國Blue Yeti 雪怪 USB麥克風, 價格: 5590 元

# 字串格式化 方法3. Formatted String Literal - 將運算式置於字串之中

text = 'world'
print(f'Hello, {text}') # Hello, world

x = 10
y = 27
print(f'x + y = {x + y}') # x + y = 37

# 字串格式化 方法4. Template String 樣板字串 - 使用 string.Template

from string import Template
mytext = 'world'
t = Template('Hello $text') # 使用1個變數 $text
type(t) # string.Template
t.substitute(text=mytext) # 將 text置換為 mytext, 'Hello world'
# 參考: https://stackabuse.com/formatting-strings-with-the-python-template-class

##############################
# 02.正規表示式
##############################

# https://docs.python.org/3/library/re.html

# re.complile  建立正規表示式
# re.match     從開始位置檢查是否匹配. 如果有, 則回傳匹配結果. 如果沒有, 則回傳 None
# re.fullmatch 從開始或結束位置檢查是否匹配
# re.search    從任何位置開始模式匹配，回傳第1筆
# re.findall   回傳與模式匹配的所有字串
# re.split     分割
# re.sub       取代

# re範例-電話號碼
# 參考: Automate the Boring Stuff with Python, 第2版.
# 參考: Python 自動化的樂趣｜搞定重複瑣碎&單調無聊的工作, 碁峰資訊, 2020.

# 02-8101-8800 (區域碼)2碼數字–4碼數字–4碼數字

# 方法1-使用 if, for
def isPhoneNumber(text):
    if len(text) != 12:
        return False  # not phone number-sized
    for i in range(0, 2):
        if not text[i].isdecimal():
            return False  # not an area code
    if text[2] != '-':
        return False  # does not have first hyphen
    for i in range(3, 7):
        if not text[i].isdecimal():
            return False  # does not have first 3 digits
    if text[7] != '-':
        return False  # does not have second hyphen
    for i in range(8, 12):
        if not text[i].isdecimal():
            return False  # does not have last 4 digits
    return True  # "text" is a phone number!

print('02-8101-8800is a phone number:')
print(isPhoneNumber('02-8101-8800'))

print('02-1234-ALAN is a phone number:')
print(isPhoneNumber('02-1234-ALAN'))

# 方法2-使用正規表示式
import re

phoneRegex = re.compile(r'\d\d-\d\d\d\d-\d\d\d\d') # 建立正規表示式物件

mystr = '02-8101-8800'
myresult1 = phoneRegex.match(mystr)
myresult1

mystr = '02-8101-ALAN'
myresult2 = phoneRegex.match(mystr)
myresult2

# re範例-字串
mystr = 'Please call ALAN at 02-2822-5252. 02-1234-5678 is his office number. Try 02-87654321'

# match 方法
phoneRegex = re.compile(r'\d\d-\d\d\d\d-\d\d\d\d') # 建立正規表示式物件

# 方法1
myresult = phoneRegex.match(mystr) # 使用match, 從最左側搜尋.
print(myresult) # None 表示沒有找到符合字串

# 方法2
myresult1 = re.match(phoneRegex, mystr)
print(myresult1) # None,與方法1結果相同.

# fullmatch 方法, 與 match類似,除了最左側另包括最右側搜尋
print(re.fullmatch(phoneRegex, mystr)) # None

# search 方法
phoneRegex = re.compile(r'\d\d-\d\d\d\d-\d\d\d\d')
phoneRegex.search(mystr) 
# 有找到1筆資料
# <re.Match object; span=(20, 32), match='02-2822-5252'>

phoneRegex = re.compile(r'\d{2}-\d{4}-\d{4}')
phoneRegex.search(mystr) # 結果與前面相同

# findall 方法
phoneRegex.findall(mystr)
# ['02-2822-5252', '02-1234-5678']

# 實作練習3
mystr = '隨著歐美多國解封，燃油車、電動車市況明顯回溫，帶動車用電子強勁需求，相關零組件廠出貨也陸續報捷，車電族群今 (13) 日再度發動猛攻，包括強茂 (2481-TW)、凌通 (4952-TW)、欣銓 (3264-TW)、愛普 (6531-TW) 等多檔，盤中均亮燈漲停。'
# 以 mystr 字串練習, 使用 findall 找出所有股票代碼
# 結果為 ['2481-TW', '4952-TW', '3264-TW', '6531-TW']

# group 方法,使用左右括號 ()
mystr = '101大樓客服電話是 02-8101-8800'

phoneRegex = re.compile(r'(\d{2})-(\d{4}-\d{4})')
myresult = re.search(phoneRegex, mystr)
print(myresult) # match='02-8101-8800'

myresult.group(0) # 取得全部號碼 '02-8101-8800'
myresult.group(1) # 取得區域號碼 '02'
myresult.group(2) # 取得電話號碼 '8101-8800'

# groups 方法
areaCode, mainCode = myresult.groups()
areaCode # '02'
mainCode # '8101-8800'

# group 方法+跳脫字元
mystr = '101大樓客服電話是 (02)-8101-8800'
phoneRegex = re.compile(r'(\d{2})-(\d{4}-\d{4})')
myresult = re.search(phoneRegex, mystr)
print(myresult) # None-->找不到???

phoneRegex = re.compile(r'(\(\d{2}\))-(\d{4}-\d{4})')
myresult = re.search(phoneRegex, mystr)
print(myresult)

myresult.group(0) # 取得全部號碼 '02-8101-8800'
myresult.group(1) # 取得區域號碼 '(02)'
myresult.group(2) # 取得電話號碼 '8101-8800'

##############################
# 03.pandas模組簡介
##############################

# https://pandas.pydata.org/
# Pandas 模組是一個功能強大且靈活的資料分析套件, 特別針對表格式資料集進行操作.

# 主要功能
# 1.序列和資料框: 支援多種數據結構, 包括:一維序列(Series, 類似工作表的1行資料). 二維資料框(DataFrame, 類似於整個工作表).
# 2.數據操作: 提供了許多用於資料操作的方法, 例如選擇列,行, 排序, 過濾, 群組.
# 3.數據分析: 整合了多種統計和視覺化工具, 如計算平均值、標準差等. 
# 4.資料視覺化: 繪製圖表用的散佈圖、線圖、盒鬚圖等數據視覺效果. https://pandas.pydata.org/docs/reference/plotting.html

# 10 minutes to pandas
# https://pandas.pydata.org/docs/user_guide/10min.html

# 載入2大套件 numpy, pandas
import numpy as np  # Python Scientific Computing Library
import pandas as pd # Python Data Analysis Library

##############################
# pandas 序列(Series)物件
##############################

# s = pd.Series(data, index=index)
# data 包括使用 array, Iterable, dict, scalar value
# 序列包括指標(Index) 與值(Value), 指標採用預設整數型態指標 0,1,2,...

# (1).Series - 使用 ndarray
s = pd.Series(data = np.random.randn(5), index=["a", "b", "c", "d", "e"])
s
# a   -0.492604
# b   -0.073386
# c   -0.063632
# d    0.197128
# e    0.178333
# dtype: float64
type(s) # pandas.core.series.Series

# (2).Series -使用 Iterable - 序列(tuple)
s1 = pd.Series((1,3,5,np.nan,6,8))
s1

# (3).Series - 使用 Iterable - 串列(List)
s2 = pd.Series([1,3,5,np.nan,6,8])
s2

s1 == s2 # equality 相等, 比較每個元素是否相同, 大部分使用此功能.
s1 is s2 # identity 相同, 比較二物件是否指向同一個記憶體

id(s1)
id(s2) # 與id(s1) 不相等

# "==" 與 "is" ("is not") 應用

# identity - 使用 id 函數, 查看說明 help(id). 相同程式 id 結果,每次不一定相同.
# https://realpython.com/python-is-identity-vs-equality/

a = 'Hello world'
b = 'Hello world'
a == b
a is b
id(a)
id(b)

# 整數 [-5 ~ 256] 會使用相同記憶體位址功能
a = 256
b = 256
a == b   # True
a is b   # True
id(a)
id(b)

a = 1000
b = 1000
a == b   # True
a is b   # False
id(a)
id(b)

x1 = np.nan
x2 = np.nan
id(x1)
id(x2) # 與上面結果相同
x1 == x2 # False
x1 is x2 # True

# (4).Series - 使用 Iterable - 字典(Dict)
# 在 pandas 模組之中, NaN 表示為 "not a number"
x = {"x1": 1, "x2": 2, "a": np.nan, "b": 3, "c": 4}
c = pd.Series(x)
c

# (5).Series - 使用 scalar value
pd.Series(999.0, index=["a", "b", "c", "d", "e"])

##############################
# Series 使用 ndarray-like 操作
##############################
c
# x1    1.0
# x2    2.0
# a     NaN
# b     3.0
# c     4.0
# dtype: float64

c[0]              # 1.0
c[1]              # 2.0
c[-1]             # 4.0
c[:3]
# x1    1.0
# x2    2.0
# a     NaN
# dtype: float64

c[c > c.median()]
c[[1, 3, 2]]
np.exp(c)
c.dtype

# Series.array 是 pandasExtensionArray.
# ExtensionArray 是包括一個或多個 numpy.ndarray 的 thin wrapper類別
c.array      # 將 series 轉換為 PandasArray

c1 = c.to_numpy() # 將 series 轉換為 NumPy ndarray
c1

c2 = c.to_numpy
c2

c1 == c2
c1 is c2

##############################
# Series 使用 dict-like 操作
##############################
c

c['x1']
c['a'] = np.pi

'x1' in c

c.get("a")
c.get("e") # None

##############################
# pandas 資料框(DataFrame)物件
##############################

# 方法1.建立指標(index)與值(values), 將指標與值合併為資料框.

# 步驟1-建立 DatetimeIndex 物件
dates = pd.date_range('20210801', periods=6) # 日期指標
dates
type(dates)

# 步驟2-建立 DataFrame
# 欄位名稱: A, B, C, D
df1 = pd.DataFrame(np.random.randn(6,4), index=dates, columns=list('ABCD'))
df1
type(df1)

# 方法2.使用字典建立資料框
df2 = pd.DataFrame({ 'A' : 1.,
    'B' : pd.Timestamp('20210801'),
    'C' : pd.Series(1,index=list(range(4)),dtype='float32'),
    'D' : np.array([3] * 4,dtype='int32'),
    'E' : pd.Categorical(["test","train","test","train"]),
    'F' : 'foo' })
df2

# dtypes: 顯示各欄位的資料型態
df2.dtypes

# 方法3.使用 list of dicts 建立資料框

# 使用預設指標 0, 1, 2,...
mydata = [{"a": 1, "b": 2}, {"a": 5, "b": 10, "c": 20}]
df3 = pd.DataFrame(mydata)
df3

# 客製化指標
df4 = pd.DataFrame(mydata, index=["first", "second"])
df4

# 方法4.使用 dict of tuples 建立資料框
# 使用 tuples dictionary, 可建立 MultiIndexed dataframe(階層式指標資料框)
df5 = pd.DataFrame(
    {
        ("a", "b"): {("A", "B"): 1, ("A", "C"): 2},
        ("a", "a"): {("A", "C"): 3, ("A", "B"): 4},
        ("a", "c"): {("A", "B"): 5, ("A", "C"): 6},
        ("b", "a"): {("A", "C"): 7, ("A", "B"): 8},
        ("b", "b"): {("A", "D"): 10, ("A", "B"): 11},
    }
)
df5
type(df5)

# 方法5.使用 list of dataclasses 建立資料框
# pandas 1.1.0 新增功能, 參考 PEP 557 -- Data Classes
# list of dataclasses 類似於 list of dictionaries
# https://www.python.org/dev/peps/pep-0557/

##############################
# 資料檢視
##############################
np.random.seed(123)
dates = pd.date_range('20210801', periods=6) # 日期指標
df1 = pd.DataFrame(np.random.randn(6,4), index=dates, columns=list('ABCD'))
df1

# head 顯示前 5 筆資料, 此功能與 R 顯示 6 筆不相同.
df1.head()

df1.head(3) # 顯示前 3 筆資料

df1.tail()  # 顯示後 5 筆資料

# 顯示指標(index)
df1.index

# 欄名稱(columns)
df1.columns

# 資料值(values)
df1.values

# T 資料轉置, 類似將原本長資料 (Long data), 轉換為寬資料 (Wide data)
df1.T

##############################
# describe 統計摘要(statistic summary)
##############################

# count 個數
# mean 平均值
# std  標準差 standard deviation, 一般希望愈小愈好
# min  最小值
# 25%  25百分位數
# 50%  50百分位數, 中位數 median
# 75%  75百分位數 (quantile)
# max  最大值

df1.describe()

##############################
# 排序
##############################

# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sort_values.html

# (1).排序 sort_index

# axis為排序的軸，0表示 rows index(列指標)，1表示 columns index(行指標)
# 當對資料"列" 進行排序時，axis必須設置為0.
# df.sort(["A"]) 新版不支援 sort 函數, 改用 sort_values 或 sort_index

# ascending =FALSE, 即遞增是FALSE, 表示遞減是TRUE, 結果為D,C,B,A
df1.sort_index(axis=1, ascending=False)

# (2).排序 sort_values

# 依照 B 欄大小, 由小至大排序 (預設值是遞增)
df1.sort_values(by='B')

# 依照 B 欄大小, 改為由大至小排序 (遞減)
df1.sort_values(by='B', ascending = False)

# 依照 B 欄大小, 將 nan 排在最前面或最後面
df1.iloc[2, 0] = np.nan
df1
df1.sort_values(by='A')
df1.sort_values(by='A', na_position = 'first')

# 實作練習4
# 建立 mydf 資料框並進行A欄位遞增, B欄位遞減排序.
#    A   B   C
# 0  1  10  aa
# 1  2  24  bb
# 2  2  26  cc
# 3  4   9  dd
# 4  2  29  aa

##############################
# 資料列,行選取
##############################
import numpy as np
import pandas as pd
np.random.seed(123)
dates = pd.date_range('20210801', periods=6) # 日期指標
df1 = pd.DataFrame(np.random.randn(6,4), index=dates, columns=list('ABCD'))
df1

# 選取1行
df1['A'] # 建議採用此法
df1.A

# 選取多行
df1[['A', 'B']]

df1

# 選取列, df[1:4]選取指標第1至第3列(4-1=3), 此功能與 R 不同.
df1[1:4]

##############################
# 使用 iloc
##############################
# 使用 iloc, 其中的 i 表示 index.
df1.iloc[2]      # 篩選第2列
df1.iloc[2:5,]   # 篩選第2列~第4列(5-1=4)
df1.iloc[2:5,:]  # same as the above

df1.iloc[, 2]    # ERROR
df1.iloc[:, 2]   # OK
df1.iloc[:, 1:3] # OK, 第1行~第2行(3-1=2)

df1.iloc[[1,2,4], [0,2]] # 選取不連續範圍
df1.iloc[2, 2]           # 驗證選取結果

##############################
# 使用 loc
##############################
# Boolean Indexing 指標的布林運算選取
df1.loc[dates[2]]
df1.loc['20210803']

df1.loc[:, ['A','B']]
df1.loc[, 1:3]   # ERROR, 改用 .iloc
df1.loc[:, 1:3]  # ERROR, 改用 .iloc
df1.loc['20210803', ['A', 'B']]
df1.loc['20210802':'20210804', ['A', 'B']]

##############################
# 使用 iat
##############################
df1.iat[2, 2] # 選取列, 行的一個值, 輸入參數為一個整數值

##############################
# 資料篩選
##############################

# 邏輯值選取
df1[df1 > 1.5]
df1[df1['A'] > 1.2]

# 使用 isin - 範例1
df1[df1.index.isin(['2021-08-02', '2021-08-04'])]

# 使用 isin - 範例2
df2 = df1.copy()
df2['E'] = ['one', 'one','two','three','four','three']
df2
df2[df2['E'].isin(['two','four'])]

# Missing Data 遺漏值 np.NaN (np.nan)
# R: 使用 NA 表示
df3 = df1.reindex(index=dates[0:4], columns=list(df1.columns) + ['E'])
df3.loc[dates[0]:dates[1],'E'] = 1
df3

# 判斷NaN
pd.isnull(df3)

# 刪除列中包括 NaN
df3.dropna(how='any')

# 將遺漏值填入值
df3.fillna(value=999)

##############################
# 列,行的匯總計算
##############################
"""
A B C
1 5 
2 NaN 10
3 7 11
4 8 12
"""
df = pd.read_clipboard() # 選取上述範圍內資料, Ctrl + C
df
df.dtypes    
df.isnull()

# 計算每行平均
df.mean()

# 計算每列平均
df.mean(1)

# apply 將資料套用至函數
df.apply(np.cumsum) # 各資料行, 進行逐列累計加總

##############################
# 列合併 append, concat 
##############################

np.random.seed(123)
df = pd.DataFrame(np.random.randn(3, 4))
df

pieces = pd.DataFrame(np.random.randn(2, 4))
pieces

# append 列合併
df.append(pieces, ignore_index=True) # ERROR, v2.0新版改用 concat

# concat 列合併, 類似 R 的 rbind {base}
pieces1 = pd.DataFrame(np.random.randn(2, 4))
pieces1

pd.concat([df, pieces, pieces1]) # 預設值為保持原有指標
pd.concat([df, pieces, pieces1], ignore_index=True) # 改為忽略指標

##############################
# Grouping 群組計算
##############################

# 下載 Cars93.csv
# https://github.com/rwepa/DataDemo/blob/master/Cars93.csv

import numpy as np
import pandas as pd

# 匯入資料
df = pd.read_csv('Cars93.csv')
df
df.dtypes     # 資料型態
df.columns    # 欄位名稱
df.describe() # 結果顯示 ... 表示隱藏結果, count會顯示missing data
df.describe(include='all') # 包括所有欄位(例: object)

# pandas 設定顯示所有欄位
# pd.set_option('display.expand_frame_repr', False)
# pd.set_option('display.max_columns', None)
# pd.set_option('display.max_rows', None)

# 顯示所有結果, 不會有隱藏資料, 但資料可能會左右不對齊.
df.describe()

# 顯示所有結果, 不會有隱藏資料, 但資料可能會左右不對齊.
df # 結論: Consoles\Restart kernel

##############################
# 注意:  pandas 匯入 None 資料後, 自動轉換為 NAN (Spyder物件檢視為nan)
##############################

# https://www.datasciencebyexample.com/2022/08/24/2022-08-24-1/#google_vignette
# None: 'Missing data'
# NaN: 'Not a Number', undefined or unrepresentable values.

# 判斷是否為 nan
df['AirBags']
df['AirBags'].isna()
pd.isnull(df['AirBags'])

# 篩選重要特徵值(變數)
df = df[['Manufacturer', 'Price', 'AirBags', 'Horsepower', 'Origin']]

# 前5筆資料
df.head()

# 包括字串(object)與數值(float64),整數(int64)資料
df.dtypes

# 群組 - 1個維度
df_AirBags = df.groupby('AirBags')

type(df_AirBags) # pandas.core.groupby.generic.DataFrameGroupBy

print(df_AirBags.groups) # 群組沒有顯示 nan

# 篩選群組
df_AirBags.get_group('Driver & Passenger')

# 群組平均
# 因為資料包括字串與數值個不同資料型態,因此結果異常.
df_AirBags.mean()

# 群組沒有顯示 nan 之彙總運算結果
df[['Price', 'AirBags', 'Horsepower']].groupby('AirBags').mean()

# 群組有顯示 nan 之彙總運算結果
df[['Price', 'AirBags', 'Horsepower']].groupby('AirBags', dropna=False).mean()

# 使用 agg - 每行計算min
df_AirBags.agg('min')

df[['Price', 'AirBags', 'Horsepower']].groupby('AirBags', dropna=False).agg('min')

# 使用 agg - 每行計算max
df_AirBags.agg('max')

df[['Price', 'AirBags', 'Horsepower']].groupby('AirBags', dropna=False).agg('max')

# 群組 - 2個維度
df_AirBagsOrigin = df.groupby(['AirBags', 'Origin'], dropna=False)

# 群組大小
df_AirBagsOrigin.size()

df_AirBagsOrigin.min()

df_AirBagsOrigin.max()

df_AirBagsOrigin.mean() # TypeError: agg function failed [how->mean,dtype->object]

df_AirBagsOrigin.mean(numeric_only = True)

##############################
# 檔案匯入 pandas
##############################

# pandas IO 模組
# https://pandas.pydata.org/docs/user_guide/io.html

##############################
# 將 nan 以中位數填補
##############################

import pandas as pd
print(pd.__version__) # 1.2.4

# 下載 marketing.csv 至 C:\pythondata\data 資料夾
# https://github.com/rwepa/DataDemo/blob/master/marketing.csv

# 匯入資料
marketing = pd.read_csv('marketing.csv')
marketing # 200*4

# 資料摘要
marketing.describe()

# 有NaN
marketing.isnull().sum()

marketing['facebook']

# 將 facebook 變數的 NaN資料, 以中位數填滿
marketing['facebook'].fillna(marketing['facebook'].median, inplace = True)

# 沒有NaN
marketing.isnull().sum()

print(marketing)
# RecursionError: maximum recursion depth exceeded

##############################
# 匯入 Excel 檔案
##############################

# 匯入 Excel 檔案, 全國訂單明細.xlsx
# https://github.com/rwepa/DataDemo/blob/master/全國訂單明細.xlsx

sales = pd.read_excel(io = 'C:/mydata/全國訂單明細.xlsx', sheet_name = '全國訂單明細')
sales # 8568*19
sales.head()

##############################
# 匯入 SAS 檔案
##############################

# 匯入 SAS 檔案, h_nhi_ipdte103.sas7bdat
# 資料說明: 103年模擬全民健保處方及治療明細檔_西醫住院檔
# 資料筆數: 14297
# 欄位個數: 80
# 檔案大小: 7.25MB
# https://github.com/rwepa/DataDemo/blob/master/h_nhi_ipdte103.sas7bdat

ipdate = pd.read_sas(filepath_or_buffer = 'C:/mydata/h_nhi_ipdte103.sas7bdat')
ipdate # 14297*80
ipdate.head()

##############################
# 資料匯出
##############################
df = pd.DataFrame({'姓名': ['ALAN', 'LEE'],
                   '地址': ['台北市', '新北市'],
                   '年資': [10, 20]})
df
#      姓名   地址  年資
# 0  ALAN  台北市  10
# 1   LEE  新北市  20

df.to_csv('data/df.csv', index = False) # 中文亂碼

df.to_csv('data/df.csv', index = False, encoding = 'utf-8') # 中文亂碼

df.to_csv('data/df.csv', index = False, encoding = 'utf_8_sig') # OK

##############################
# 04.將AQI資料集改為Python pandas操作
##############################

# title: 日空氣品質指標(AQI)
# source: https://data.gov.tw/dataset/40507
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_2025.01.02_r_introduction.R#L453

# analysis:

# pandas plot line
# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.line.html

import pandas as pd
import matplotlib.pyplot as plt

# urls = "aqx_p_434.csv"
urls = "https://raw.githubusercontent.com/rwepa/DataDemo/refs/heads/master/aqx_p_434.csv"

df = pd.read_csv(urls)

df                # AQI資料集
df.dtypes         # 資料型態
df.columns        # 欄位名稱
df.describe()     # 資料摘要
df.shape          # 資料維度 (1000, 11)
df.isnull().sum() # nan值個數計算

# 篩選板橋資料集
df_Banqiao = df[df['sitename'] == '板橋']

# 依 monitordate 遞增排序
df_Banqiao = df_Banqiao.sort_values(by=['monitordate'])

df_Banqiao

# 篩選汐止資料集
df_Xizhi = df[df['sitename'] == '汐止']

# 依 monitordate 遞增排序
df_Xizhi = df_Xizhi.sort_values(by=['monitordate'])

df_Xizhi

# 合併為一個資料框
df_BanqiaoXizhi = pd.DataFrame({'monitordate': df_Xizhi['monitordate'].values,
                                'Banqiao': df_Banqiao['aqi'].values,
                                'Xizhi': df_Xizhi['aqi'].values})
df_BanqiaoXizhi

ax = df_BanqiaoXizhi.plot.line(x='monitordate', 
                               y=['Banqiao', 'Xizhi'],
                               title='AQI - 2025.1.22@RWEPA')
ax.set_xlabel("Date")
ax.set_ylabel("AQI")
ax.tick_params(axis='x', labelsize=8)
plt.show()
# end

##############################
# 05.matplotlib, seaborn, pandas, plotnine 模組視覺化應用
##############################

##############################
# matplotlib 資料視覺化應用
##############################

# https://matplotlib.org/
  
# 11.1 matplotlib常用語法
import matplotlib.pyplot as plt
import numpy as np

N = 50
x = np.random.rand(N)
y = np.random.rand(N)
colors = np.random.rand(N)
area = np.pi * (15 * np.random.rand(N))**2  # 半徑 0~15

# 散佈圖 plt.scatter
plt.scatter(x, y, s=area, c=colors, alpha=0.5)
plt.savefig('random.plot.png')
plt.savefig('random.plot.pdf')
plt.show()

plt.scatter(x, y, s=500, c=colors, alpha=0.5)
plt.show()

# 線圖 plt.plot
plt.plot(x,y)
plt.show()

plt.plot(sorted(x), y)
plt.show()

# example 1 - 線圖
plt.plot([1, 4, 9, 16])   # x 軸: 0,1,2,3
plt.ylabel("Quality")
plt.show()

# example 2 - 點圖
plt.plot([1,2,3,4], [1,4,9,16], 'ro')  # r:red, o:circle marker
plt.axis([0, 6, 0, 20]) # set xlim and ylim
plt.show()

# example 3 - 三組資料
t = np.arange(0., 5., 0.2) # 等差級數, 區間包括左側啟始值, 不包括右側結束值

# red dashes, blue squares and green triangles
plt.plot(t, t, 'r--', t, t**2, 'bs', t, t**3, 'g^')
plt.show()

# example 4 - 二列一行繪圖

# 211: (nrow, ncol, plot_number) 
plt.subplot(211)     # 第1個圖形
plt.plot([1, 2, 3])

plt.subplot(212)     # 第2個圖形
plt.plot([1, 4, 9])

plt.subplot(211)     # 在第1個圖形上, 繪製圖形標題
plt.title('Easy as 1, 2, 3') # subplot 211 title
plt.show()

# example 5 - 二列一行繪圖
def f(t):
    return np.exp(-t) * np.cos(2*np.pi*t)

t1 = np.arange(0.0, 5.0, 0.1)
t2 = np.arange(0.0, 5.0, 0.02)

plt.subplot(211)
plt.plot(t1, f(t1), 'bo', t2, f(t2), 'k')

plt.subplot(212)
plt.plot(t2, np.cos(2*np.pi*t2), 'r--')
plt.show()

# example 6 直方圖 (histogram)
import numpy as np
import matplotlib.pyplot as plt

# Fixing random state for reproducibility
np.random.seed(123)

mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)

# 直方圖
n, bins, patches = plt.hist(x, 50, density=True, facecolor='g', alpha=0.75)
plt.xlabel('Smarts')
plt.ylabel('Probability')
plt.title('Histogram of IQ')
plt.text(80, 0.025, r'$\mu=100,\ \sigma=15$', size = 20)
plt.xlim(40, 160)
plt.ylim(0, 0.03)
plt.grid(True)
plt.show()

# example 7 多列多行繪圖
fig = plt.figure()

# subplot:設定圖形位置(列,行,編號)
# fig.add_subplot(221)   #top left
# fig.add_subplot(222)   #top right
# fig.add_subplot(223)   #bottom left
# fig.add_subplot(224)   #bottom right 
# plt.show()

# plt.subplot()
# subplot(232) # 2列, 3行, 圖2位置
# 圖1 , 圖2 , 圖3
# 圖4 , 圖5 , 圖6

# 預設 color 有8個
"""
b: blue
g: green
r: red
c: cyan
m: magenta
y: yellow
k: black
w: white
"""

# https://matplotlib.org/users/colors.html

# line style or marker
"""
'-'	  solid line style
'--'	  dashed line style
'-.'	  dash-dot line style
':'	  dotted line style
'.'	  point marker
','	  pixel marker
'o'	  circle marker
'v'	  triangle_down marker
'^'	  triangle_up marker
'<'	  triangle_left marker
'>'	  triangle_right marker
'1'	  tri_down marker
'2'	  tri_up marker
'3'	  tri_left marker
'4'	  tri_right marker
's'	  square marker
'p'	  pentagon marker
'*'	  star marker
'h'	  hexagon1 marker
'H'	  hexagon2 marker
'+'	  plus marker
'x'	  x marker
'D'	  diamond marker
'd'	  thin_diamond marker
'|'	  vline marker
'_'	  hline marker
"""

# 水雷 vs. 岩石 視覺化分析

import pandas as pd
import matplotlib.pyplot as plt

target_url = "https://archive.ics.uci.edu/ml/machine-learning-databases/undocumented/connectionist-bench/sonar/sonar.all-data"

# 資料: 208列, 61行
# X: V0-V59
# Y: V60
# 第61行: R: rock  岩石
# 第61行: M: mine 水雷

rocksVMines = pd.read_csv(target_url, header=None)

rocksVMines.columns = ['V' + str(i) for i in range (0, 61)]

rocksVMines
#          V0      V1      V2      V3      V4  ...     V56     V57     V58     V59  V60
# 0    0.0200  0.0371  0.0428  0.0207  0.0954  ...  0.0180  0.0084  0.0090  0.0032    R
# 1    0.0453  0.0523  0.0843  0.0689  0.1183  ...  0.0140  0.0049  0.0052  0.0044    R
# 2    0.0262  0.0582  0.1099  0.1083  0.0974  ...  0.0316  0.0164  0.0095  0.0078    R
# 3    0.0100  0.0171  0.0623  0.0205  0.0205  ...  0.0050  0.0044  0.0040  0.0117    R
# 4    0.0762  0.0666  0.0481  0.0394  0.0590  ...  0.0072  0.0048  0.0107  0.0094    R
# ..      ...     ...     ...     ...     ...  ...     ...     ...     ...     ...  ...
# 203  0.0187  0.0346  0.0168  0.0177  0.0393  ...  0.0065  0.0115  0.0193  0.0157    M
# 204  0.0323  0.0101  0.0298  0.0564  0.0760  ...  0.0034  0.0032  0.0062  0.0067    M
# 205  0.0522  0.0437  0.0180  0.0292  0.0351  ...  0.0140  0.0138  0.0077  0.0031    M
# 206  0.0303  0.0353  0.0490  0.0608  0.0167  ...  0.0034  0.0079  0.0036  0.0048    M
# 207  0.0260  0.0363  0.0136  0.0272  0.0214  ...  0.0040  0.0036  0.0061  0.0115    M

# print head and tail of data frame
print(rocksVMines.head())
print(rocksVMines.tail())

# print summary of data frame
summary = rocksVMines.describe()
print(summary)
#                V0          V1          V2  ...         V57         V58         V59
# count  208.000000  208.000000  208.000000  ...  208.000000  208.000000  208.000000
# mean     0.029164    0.038437    0.043832  ...    0.007949    0.007941    0.006507
# std      0.022991    0.032960    0.038428  ...    0.006470    0.006181    0.005031
# min      0.001500    0.000600    0.001500  ...    0.000300    0.000100    0.000600
# 25%      0.013350    0.016450    0.018950  ...    0.003600    0.003675    0.003100
# 50%      0.022800    0.030800    0.034300  ...    0.005800    0.006400    0.005300
# 75%      0.035550    0.047950    0.057950  ...    0.010350    0.010325    0.008525
# max      0.137100    0.233900    0.305900  ...    0.044000    0.036400    0.043900

# 平行座標軸 Parallel coordinates graph
for i in range(208):
    # assign color based on color based on "M" or "R" labels
    if rocksVMines.iat[i,60] == "M":
        pcolor = "red"
    else:
        pcolor = "blue"

    # plot rows of data as if they were series data
    dataRow = rocksVMines.iloc[i, 0:60]
    plt.rcParams["figure.figsize"] = (20, 15) #(寬, 高)
    dataRow.plot(color=pcolor, alpha=0.5)
    # plot.figure(figsize=(16, 16))

plt.xlabel("Attribute Index")
plt.ylabel("Attribute Values")
plt.show()

##############################
# seaborn 資料視覺化應用
##############################

# https://seaborn.pydata.org/
# seaborn-data: https://github.com/mwaskom/seaborn-data

# Anaconda 已經安裝 seaborn 模組
import seaborn as sns
import matplotlib.pyplot as plt

sns.set(style="ticks")

df = sns.load_dataset("iris")
df
#      sepal_length  sepal_width  petal_length  petal_width    species
# 0             5.1          3.5           1.4          0.2     setosa
# 1             4.9          3.0           1.4          0.2     setosa
# 2             4.7          3.2           1.3          0.2     setosa
# 3             4.6          3.1           1.5          0.2     setosa
# 4             5.0          3.6           1.4          0.2     setosa
# ..            ...          ...           ...          ...        ...
# 145           6.7          3.0           5.2          2.3  virginica
# 146           6.3          2.5           5.0          1.9  virginica
# 147           6.5          3.0           5.2          2.0  virginica
# 148           6.2          3.4           5.4          2.3  virginica
# 149           5.9          3.0           5.1          1.8  virginica
# [150 rows x 5 columns]

# 散佈圖矩陣 pairplot {seaborn}
# hue: color參數
sns.pairplot(df, hue="species")
plt.show()

# diag_kind: 對角線圖形
sns.pairplot(df, hue="species", diag_kind="hist")
plt.show()

# kde繪圖
sns.pairplot(df, kind="kde")
plt.show()

# 加上顏色,形狀
sns.pairplot(df, hue="species", markers=["o", "s", "D"])
plt.show()

# Question:
# import seaborn as sns 
# --> ImportError: DLL load failed: 找不到指定的程序。

# Solution: 可能是 scipy 或是 numpy 的版本問題, 移除後重新安裝
# conda remove numpy
# conda install numpy
# conda install seaborn

##############################
# pandas 資料視覺化應用
##############################
# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.html

##############################
# plotnine 資料視覺化應用
##############################

# https://plotnine.org/
# plotnine is an implementation of a grammar of graphics in Python based on ggplot2. 

# 安裝 plotnine 模組
# pip install plotnine

from plotnine import ggplot, geom_point, aes, stat_smooth, facet_wrap
from plotnine.data import mtcars

# 散佈圖
# wt 值愈大, mpg 愈小(mpg: miles per US gallon in city)
(
    ggplot(mtcars, aes("wt", "mpg"))
    + geom_point()
)

# 群組散佈圖 + 顏色
(
    ggplot(mtcars, aes("wt", "mpg", color="factor(gear)"))
    + geom_point()
    #+ stat_smooth(method="lm")
    #+ facet_wrap("gear")
)

# 群組散佈圖 + 顏色 + 線性迴歸
(
    ggplot(mtcars, aes("wt", "mpg", color="factor(gear)"))
    + geom_point()
    + stat_smooth(method="lm")
)

# 群組散佈圖 + 顏色 + 線性迴歸 + 分面(facet_wrap)
# 所有圖形之X, Y軸刻度皆相同
(
    ggplot(mtcars, aes("wt", "mpg", color="factor(gear)"))
    + geom_point()
    + stat_smooth(method="lm")
    + facet_wrap("gear")
)
# 參考: https://r-graph-gallery.com/ggplot2-package.html

# 實作練習1
# 練習 mynumbers 字串分割為二個數值並計算數值加總.

# analysis: 學員練習使用字串分割 – split

# 實作練習2
# 計算 mystr 字串中, 不區分大小寫, 英文字母出前次數最多的前6名為何?
mystr = 'Scikit-learn is an Open source Machine Learning library that supports supervised and unsupervised learning.'
# 技巧: 使用 collections.Counter 方法
# 答案為 n, e, i, r, s, a

# analysis:
mystr = 'Scikit-learn is an Open source Machine Learning learning library that supports supervised and unsupervised learning.'
# 技巧: 使用 collections.Counter 方法

# 步驟1.轉換為 list
mylist_tmp = list(mystr)

# 步驟2.判斷是否為字母, 如果是字母, 轉換成小寫
mylist = []
for x in mylist_tmp:
    if x.isalpha():
        mylist.append(x.lower())
mylist

# 步驟3.使用 counter 計算字母發生次數並轉換為 dict
import collections
mycounter = collections.Counter(mylist)
mycounter
mycounter.keys()
mycounter.values()

# 步驟4.排序發生次數

# 最大值
max(mycounter, key=mycounter.get)

# 由小至大排序
sorted(mycounter, key=mycounter.get)

# 由大至小排序
sorted(mycounter, key=mycounter.get, reverse=True)

# 由大至小排序,並列出(key,value)結果, 最多為 n,e,i,r,s,a
mystrsort = sorted(mycounter.items(), key=lambda x: x[1], reverse=True)
mystrsort

# 答案為 n, e, i, r, s, a
mystrsort[0:6]

# 實作練習3
mystr = '隨著歐美多國解封，燃油車、電動車市況明顯回溫，帶動車用電子強勁需求，相關零組件廠出貨也陸續報捷，車電族群今 (13) 日再度發動猛攻，包括強茂 (2481-TW)、凌通 (4952-TW)、欣銓 (3264-TW)、愛普 (6531-TW) 等多檔，盤中均亮燈漲停。'
# 以 mystr 字串練習, 使用 findall 找出所有股票代碼
# 結果為 ['2481-TW', '4952-TW', '3264-TW', '6531-TW']

# analysis:
import re
stockRegex = re.compile(r'\d{4}-TW')
re.findall(stockRegex, mystr)

# 實作練習4
# 建立 mydf 資料框並進行A欄位遞增, B欄位遞減排序.
#    A   B   C
# 0  1  10  aa
# 1  2  24  bb
# 2  2  26  cc
# 3  4   9  dd
# 4  2  29  aa

# analysis:
import pandas as pd
mydf = pd.DataFrame(
    {'A': [1,2,2,4,2],
     'B': [10,24,26,9,29],
     'C': ['aa', 'bb', 'cc', 'dd', 'aa']})
mydf

mydf.sort_values(by=['A', 'B'], ascending = [True, False])
mydf # mydf 內容沒有更改

# 使用 inplace=True, mydf 內容已經更改.
mydf.sort_values(by=['A', 'B'], ascending = [True, False],  inplace=True) 
mydf
# end

##############################
# 06.行銷案例應用
##############################

# 線上交易銷售資料
# 直接 github 下載: https://github.com/rwepa/DataDemo/blob/master/OnlineRetail.csv.zip
# 下載檔名：OnlineRetail.csv.zip
# 解壓縮後檔名: OnlineRetail.csv
# 檔案筆數：541909列
# 欄位數：8欄
# 解壓縮後大小：43.4MB
# 原始資料：https://www.kaggle.com/vijayuv/onlineretail
# 參考資料：https://towardsdatascience.com/data-driven-growth-with-python-part-1-know-your-metrics-812781e66a5b

##############################
# 安裝與載入套件
##############################

# Anaconda 已經安裝 plotly 模組

# 載入套件
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

from plotly.offline import plot # method 1: plot(fig)
import plotly.express as px # method 2: fig.show()
import plotly.graph_objs as go

# 設定 plotly繪圖預設顯示於瀏覽器
import plotly.io as pio
pio.renderers.default='browser'

# 匯入CSV檔案
df = pd.read_csv('OnlineRetail.csv')

# 前5筆資料
df.head(5)

# 後5筆資料
df.tail()

# 欄位名稱
df.columns

# 資料摘要-數值
df.describe()

# 資料摘要-類別
# Country 唯一值為38個
df.describe(include = 'object')

# 資料摘要-數值＋類別
df.describe(include = 'all')

# 找出有用的特徵(有意義的屬性)
# Customer ID
# Unit Price
# Quantity
# Invoice Date

# 將 InvoiceDate 欄位轉換為日期
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])
df['InvoiceDate']

##############################
# 新增評估欄位 InvoiceYearMonth 發票年月
##############################

df['InvoiceYearMonth'] = df['InvoiceDate'].map(lambda date: 100*date.year + date.month)
df['InvoiceYearMonth']

##############################
# 新增評估欄位 Revenue 收入
##############################

df['Revenue'] = df['UnitPrice'] * df['Quantity']
df['Revenue']

# 建立年月為群組,收入小計資料
df_revenue = df.groupby(['InvoiceYearMonth'])['Revenue'].sum().reset_index()
df_revenue

# 每月收入統計圖
plot_data = [
    go.Scatter(
        x=df_revenue['InvoiceYearMonth'],
        y=df_revenue['Revenue'],
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖1.每月收入統計圖')

fig = go.Figure(data=plot_data, layout=plot_layout)

# method 1
plot(fig)

# method 2
fig.show()

# 每月收入向上增加趨勢.
# 2011年2,4月達到最低點.

##############################
# 每月收入變化百分比
##############################

# 使用 pct_change() 函數計算"每月收入百分比變化"

df_revenue['MonthlyGrowth'] = df_revenue['Revenue'].pct_change()
df_revenue
# (560000.260-748957.020)/748957.020 = -0.252293

# 每月收入百分比變化統計圖
plot_data = [
    go.Scatter(
        x=df_revenue.query("InvoiceYearMonth < 201112")['InvoiceYearMonth'],
        y=df_revenue.query("InvoiceYearMonth < 201112")['MonthlyGrowth'],
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖2.每月收入百分比變化統計圖'
    )

fig = go.Figure(data=plot_data, layout=plot_layout)

fig.show()

##############################
# pandas 資料處理技巧
##############################

# 1.groupby 群組小計
# 2.rename 欄位重新命名
# 3.sort_values 排序

# 38個國家, 優先考慮國家資料筆數最多者 - United Kingdom
df_country = df.groupby(['Country']).size().reset_index()
df_country

# 欄位重新命名
df_country.rename(columns={0:'Count'}, inplace=True)

# 排序
df_country.sort_values(by=['Count'], ascending=False)

# 建立篩選 United Kingdom 資料集
df_uk = df.query("Country=='United Kingdom'").reset_index(drop=True)
df_uk # 495478 rows × 10 columns

##############################
# 建立每月活動客戶數統計表
##############################

# nunique: Count distinct observations over requested axis.
df_monthly_active = df_uk.groupby('InvoiceYearMonth')['CustomerID'].nunique().reset_index()
df_monthly_active

# 每月活動客戶數長條圖
plot_data = [
    go.Bar(
        x=df_monthly_active['InvoiceYearMonth'],
        y=df_monthly_active['CustomerID'],
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖3.每月活動客戶數長條圖'
    )

fig = go.Figure(data=plot_data, layout=plot_layout)

fig.show()
# 2011年4月客戶數從3月的 923降低至 817, 減少 (817-923)/923 = -11.5%

##############################
# 每月每筆訂單平均收入
##############################

df_monthly_order_avg = df_uk.groupby('InvoiceYearMonth')['Revenue'].mean().reset_index()
df_monthly_order_avg

# 每月每筆訂單平均收入長條圖
plot_data = [
    go.Bar(
        x=df_monthly_order_avg['InvoiceYearMonth'],
        y=df_monthly_order_avg['Revenue'],
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖4.每月每筆訂單平均收入長條圖'
    )
fig = go.Figure(data=plot_data, layout=plot_layout)
fig.show()

##############################
# 建立評估欄位: 新客戶, 舊客戶
##############################

# 建立第1次消費之客戶
# 以客戶編號為群組, 計算 Min{發票日期}
df_min_purchase = df_uk.groupby('CustomerID').InvoiceDate.min().reset_index()

# 修改欄位名稱
df_min_purchase.columns = ['CustomerID','MinPurchaseDate']
df_min_purchase

# 新增欄位 - 轉換日期格式: 西元年月
df_min_purchase['MinPurchaseYearMonth'] = df_min_purchase['MinPurchaseDate'].map(lambda date: 100*date.year + date.month)

df_min_purchase # 3950 rows × 3 columns

df_uk # 495478 rows × 10 columns

# 合併 {MinPurchaseDate, MinPurchaseYearMonth} 至 df_uk 之最右側

df_uk = pd.merge(df_uk, df_min_purchase, on='CustomerID')

df_uk # 361878 rows × 12 columns

# 建立評估欄位: 客戶型態 UserType, 預設值為 New
# 如果 InvoiceYearMonth 大於 MinPurchaseYearMonth,表示之前為現有客戶, 將 UserType 改為 Existing

df_uk['UserType'] = 'New'

df_uk.loc[df_uk['InvoiceYearMonth'] > df_uk['MinPurchaseYearMonth'], 'UserType'] = 'Existing'

# 新,舊客戶的每月收入小計

# 計算每月新舊客戶收入小計
df_user_type_revenue = df_uk.groupby(['InvoiceYearMonth','UserType'])['Revenue'].sum().reset_index()

# 篩選資料並刪除前,後資料
df_user_type_revenue = df_user_type_revenue.query("InvoiceYearMonth != 201012 and InvoiceYearMonth != 201112")
df_user_type_revenue

# 繪圖
plot_data = [
    go.Scatter(
        x=df_user_type_revenue.query("UserType == 'Existing'")['InvoiceYearMonth'],
        y=df_user_type_revenue.query("UserType == 'Existing'")['Revenue'],
        name = 'Existing'
    ),
    go.Scatter(
        x=df_user_type_revenue.query("UserType == 'New'")['InvoiceYearMonth'],
        y=df_user_type_revenue.query("UserType == 'New'")['Revenue'],
        name = 'New'
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖5.新,舊客戶的每月收入統計圖'
    )
fig = go.Figure(data=plot_data, layout=plot_layout)
fig.show()

##############################
# 新客戶比率 (New Customer Ratio)
##############################

# 建立每月新客戶資料並刪除 NA
# 本例使用 unique 函數

df_user_ratio = df_uk.query("UserType == 'New'").groupby(['InvoiceYearMonth'])['CustomerID'].nunique()/df_uk.query("UserType == 'Existing'").groupby(['InvoiceYearMonth'])['CustomerID'].nunique()

# 設定 index
df_user_ratio = df_user_ratio.reset_index()

# 刪除 NA
df_user_ratio = df_user_ratio.dropna()

df_user_ratio

# 繪圖
# 考慮2月為新客戶,因此比例較高.

plot_data = [
    go.Bar(
        x=df_user_ratio.query("InvoiceYearMonth>201101 and InvoiceYearMonth<201112")['InvoiceYearMonth'],
        y=df_user_ratio.query("InvoiceYearMonth>201101 and InvoiceYearMonth<201112")['CustomerID'],
    )
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖6.新客戶比率統計圖'
    )
fig = go.Figure(data=plot_data, layout=plot_layout)
fig.show()

##############################
# 每月客戶保留率 (Monthly Retention Rate)
##############################

# 每月客戶保留率=上個月以前保留的客戶/總活躍客戶數

# 計算活躍客戶數, 依據 {CustomerID, InvoiceYearMonth}為群組, 計算收入總計.

df_user_purchase = df_uk.groupby(['CustomerID','InvoiceYearMonth'])['Revenue'].sum().reset_index()
df_user_purchase

# 使用 crosstab (交叉表) 建立客戶保留矩陣, crosstab 預設使用"發生次數"

df_retention = pd.crosstab(df_user_purchase['CustomerID'], df_user_purchase['InvoiceYearMonth']).reset_index()

df_retention

# 建立字典物件, 記錄月份, 總活躍客戶數, 保留客戶數
months = df_retention.columns[2:]
retention_array = []

for i in range(len(months)-1):
    retention_data = {}
    selected_month = months[i+1]
    prev_month = months[i]
    retention_data['InvoiceYearMonth'] = int(selected_month)
    retention_data['TotalUserCount'] = df_retention[selected_month].sum()
    retention_data['RetainedUserCount'] = df_retention[(df_retention[selected_month]>0) & (df_retention[prev_month]>0)][selected_month].sum()
    retention_array.append(retention_data)
retention_array

# 轉換為資料框
df_retention = pd.DataFrame(retention_array)
df_retention

# 計算保留率
df_retention['RetentionRate'] = df_retention['RetainedUserCount']/df_retention['TotalUserCount']
df_retention

# 繪圖
plot_data = [
    go.Scatter(
        x=df_retention.query("InvoiceYearMonth<201112")['InvoiceYearMonth'],
        y=df_retention.query("InvoiceYearMonth<201112")['RetentionRate'],
        name="organic"
    )
    
]

plot_layout = go.Layout(
        xaxis={"type": "category"},
        title='圖7.每月客戶保留率統計圖'
    )
fig = go.Figure(data=plot_data, layout=plot_layout)
fig.show()

##############################
# open/write實作練習與參考解答
##############################

# 題目參考最後一列程式碼
# https://github.com/rwepa/r_data_scientist/blob/main/python_training_2025.01.07_python_introduction.ipynb

# 檔案日期時間處理
# https://www.kaggle.com/shawon10/web-log-dataset
# 檔案名稱: weblog.csv
# 欄位個數:4
# 資料筆數:16007
# IP	Time	URL	Staus
# 10.128.2.1	[29/Nov/2017:06:58:55	GET /login.php HTTP/1.1	200
# 10.128.2.1	[29/Nov/2017:06:59:02	POST /process.php HTTP/1.1	302
# 10.128.2.1	[29/Nov/2017:06:59:03	GET /home.php HTTP/1.1	200

# 下載 https://github.com/rwepa/DataDemo/blob/master/weblog.csv

# 練習使用 open, read, datetime, re 等處理技術(不可使用 pandas),計算下列3個時段的資料筆數
# 06:00-14:00, 14:00-22:00, 22:00-06:00
# analysis:

import os
from datetime import datetime

# 新增 C:\mydata 資料夾
os.chdir("C:/mydata") # 變更工作目錄
myfile = "weblog.csv"

##############################
# Part 1.分析模式
##############################

# 讀取資料 readlines
with open(myfile, "r") as infile:
    for line in infile:
        print(line)

# 解析日期,時間-方法1, 取代"["字元為空白
mystr = "10.128.2.1,[29/Nov/2017:06:58:55,GET /login.php HTTP/1.1,200"
mystr.split(",")
mystr.split(",")[1] # '[29/Nov/2017:06:58:55'
mystrDatetime = mystr.split(",")[1].replace("[", "")
mystrDatetime # '29/Nov/2017:06:58:55'

# str 轉換為 datetime
format_string = "%d/%b/%Y:%H:%M:%S"
x = datetime.strptime(mystrDatetime, format_string)
x
x.hour # datetime 取出小時
str(x) # datetime 轉換為 str

# 解析日期,時間-方法2, 保留"["字元
datetime.strptime("[29/Nov/2017:06:58:55", "[%d/%b/%Y:%H:%M:%S")

# 測試 IndexError
'Dec'.split(",")[1].replace("[", "")

# 測試 ValueError
datetime.strptime('Dec', format_string)

# 使用 try
try:
    datetime.strptime('Dec', format_string)
    'Dec'.split(",")[1].replace("[", "")
except (ValueError, IndexError):
        print('Error')
else:
    print("OK")

# 06:00-14:00, 14:00-22:00, 22:00-06:00
# period1, period2, period3(左側有等號,右側沒有等號)

##############################
# Part 2.整合版本
##############################

period1 = list()
period2 = list()
period3 = list()

with open(myfile, "r") as infile:
    next(infile) # 第1列為標題列, 先跳過並執行下一筆資料
    format_string = "%d/%b/%Y:%H:%M:%S" # str 轉換為 datetime
    for data in infile:
        try:
            tmp = data.split(",")[1].replace("[", "") # 取代
            mydatetime = datetime.strptime(tmp, format_string) # 轉換為 datatime
            mydatetimeHour = mydatetime.hour # 取出小時
        except (ValueError, IndexError): # 使用 except 處理錯誤
            pass
        else:
            # print(tmp)
            # print(str(mydatetimeHour))
            if mydatetimeHour >= 22:
                period3.append(str(mydatetimeHour))
            elif mydatetimeHour >= 14 and mydatetimeHour < 22:
                period2.append(str(mydatetimeHour))
            elif mydatetimeHour >= 6 and mydatetimeHour < 14:
                period1.append(str(mydatetimeHour))
            elif mydatetimeHour < 6:
                period3.append(str(mydatetimeHour))
    print('...資料讀取完成')
# end for reading
            
##############################
# Part 3.結論
##############################
print(period1)
print(period2)
print(period3)

periodAnalysis = {'06:00-14:00': len(period1),
                  '14:00-22:00': len(period2),
                  '22:00-06:00': len(period3)}
periodAnalysis 
# {'06:00-14:00': 3250, '14:00-22:00': 11244, '22:00-06:00': 1295}
sum(periodAnalysis.values()) # 15789, 請驗證正確性!
# end

# 參考資料 -----

# RWEPA
# http://rwepa.blogspot.com/

# R資料科學家
# https://github.com/rwepa/r_data_scientist

# R入門資料分析與視覺化(付費,字幕)
# https://mastertalks.tw/products/r?ref=MCLEE

# R商業預測與應用(付費,字幕)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# Python資料科學家
# https://github.com/rwepa/python_data_scientist

# Python 程式設計-李明昌 <免費電子書>
# http://rwepa.blogspot.com/2020/02/pythonprogramminglee.html

# SQL實作班
# https://erp.mgt.ncu.edu.tw/sql-practical-course/

# Streamlit互動式資料應用班
# https://erp.mgt.ncu.edu.tw/streamlit-application-course/
# end
# 辛苦啦,完成Python程式之旅~~
