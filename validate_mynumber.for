c----------------------------------------------------------------
c マイナンバーの検証を行なう
c----------------------------------------------------------------
      program valid_mynumber
      implicit none             ! 変数は宣言して使おうね
      logical validate_chkdigit ! 関数の事前宣言必要なんだった

      character*13 numstr       ! 12にしちゃうと多い時判別できない
      integer l
      logical b
      call getarg(1,numstr)   ! 引数の取得(getargはサブルーチン)
      l = len_trim(numstr)    ! 空白を除去した文字数
      ! 文字数のチェックだね
      if (l.gt.12) then
        write (*,*) 'Input is over 12-digits.'
        stop
      else if(l.lt.12) then
        write (*,*) 'Input is less than 12-digits.'
        stop
      end if
      ! ここまで来たらサブルーチンまかせ
      b = validate_chkdigit(numstr)
      if (b) then
        write (*,*),'Valid number.'
      else
        write (*,*),'Invalid number.'
      end if
      stop
      end program

      ! 入力された番号が正しいか計算・検証する
      ! これがやりたいことなんだよ
      logical function validate_chkdigit(str)
        implicit none
        character*12 str    ! 引数の型宣言必要なんだった
        character c
        integer chkdigit,validdigit
        integer i,q,p,nsum,remainder
        integer atoi        ! atoiもどき
        atoi(c) = ichar(c) - ichar('0')
        nsum = 0
        !chkdigit = ichar(str(12:12)) - ichar('0')
        chkdigit = atoi(str(12:12))
        validate_chkdigit = .false.
        do i = 1, len_trim(str) - 1, 1
          !q = ichar(str(12-i:12-i)) - ichar('0')
          q = atoi(str(12-i:12-i))
          if (i.le.6) then
            p = i + 1
          else
            p = i - 5
          end if
          nsum = nsum + (p * q) ! +=とか使えなかったっけ…
        end do
        remainder = mod(nsum,11)
        if (remainder.le.1) then
          validdigit = 0
        else
          validdigit = 11 - remainder
        end if
        if (chkdigit.eq.validdigit) then
          validate_chkdigit = .true.
        else
          validate_chkdigit = .false.
        end if
      end

