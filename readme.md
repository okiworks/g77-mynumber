# MyNumber Validator (g77 version.)

## Overview
Japanese MyNumber validator.

## Usage
To use this program, it is necessary to compile with g77.

```
$ validate_mynumber 123456789012
 Invalid number.

$ validate_mynumber 123456789018
 Valid number.

$ validate_mynumber.exe 1234567890123
 Input is over 12-digits.

$ validate_mynumber.exe 1234
 Input is less than 12-digits.
```

## Author
Hironao Oki (http://oki.hateblo.jp/)

blog:[FORTRAN 77でマイナンバーのチェックデジットを計算](http://oki.hateblo.jp/entry/2016/03/08/162536)

## Reference
[マイナンバーのチェックデジットを計算する - Qiita](http://qiita.com/qube81/items/fa6ef94d3c8615b0ce64)
