object FormUpdGitea: TFormUpdGitea
  Left = 86
  Height = 92
  Top = 85
  Width = 470
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Update Gitea'
  ClientHeight = 92
  ClientWidth = 470
  Constraints.MinWidth = 470
  OnShow = FormShow
  Position = poDesktopCenter
  LCLVersion = '6.9'
  object Panel1: TPanel
    Left = 6
    Height = 30
    Top = 60
    Width = 458
    Align = alClient
    AutoSize = True
    BorderSpacing.Left = 6
    BorderSpacing.Right = 6
    BorderSpacing.Bottom = 6
    BevelOuter = bvNone
    ClientHeight = 26
    ClientWidth = 454
    Constraints.MinHeight = 30
    ParentColor = False
    TabOrder = 0
    object BitBtnUpd: TBitBtn
      Left = 376
      Height = 26
      Top = 0
      Width = 78
      Align = alRight
      AutoSize = True
      BorderSpacing.Left = 4
      Caption = '&Update'
      Constraints.MaxHeight = 30
      Constraints.MinWidth = 60
      Kind = bkYes
      ModalResult = 6
      OnClick = BitBtnUpdClick
      TabOrder = 0
      Visible = False
    end
    object BitBtnCancel: TBitBtn
      Left = 298
      Height = 26
      Top = 0
      Width = 74
      Align = alRight
      AutoSize = True
      BorderSpacing.Left = 4
      Cancel = True
      Caption = '&Cancel'
      Constraints.MaxHeight = 30
      Constraints.MinWidth = 60
      Kind = bkNo
      ModalResult = 7
      OnClick = BitBtnCancelClick
      TabOrder = 1
      Visible = False
    end
    object BitBtnOk: TBitBtn
      Left = 234
      Height = 26
      Top = 0
      Width = 60
      Align = alRight
      AutoSize = True
      BorderSpacing.Left = 4
      Constraints.MaxHeight = 30
      Constraints.MinWidth = 60
      Default = True
      DefaultCaption = True
      Kind = bkOK
      ModalResult = 1
      OnClick = BitBtnOkClick
      TabOrder = 2
      Visible = False
    end
    object ProgressBar1: TProgressBar
      Left = 0
      Height = 26
      Top = 0
      Width = 230
      Align = alClient
      Constraints.MaxHeight = 30
      Smooth = True
      TabOrder = 3
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Height = 60
    Top = 0
    Width = 470
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    ClientHeight = 60
    ClientWidth = 470
    TabOrder = 1
    object Label1: TLabel
      AnchorSideLeft.Control = Image1
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Panel2
      AnchorSideRight.Control = Panel2
      AnchorSideRight.Side = asrBottom
      Left = 62
      Height = 16
      Top = 8
      Width = 400
      Anchors = [akTop, akLeft, akRight]
      BorderSpacing.Around = 8
      Caption = 'Current version of Gitea:'
      ParentColor = False
    end
    object Label2: TLabel
      AnchorSideLeft.Control = Image1
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Label1
      AnchorSideTop.Side = asrBottom
      AnchorSideRight.Control = Panel2
      AnchorSideRight.Side = asrBottom
      Left = 62
      Height = 16
      Top = 32
      Width = 400
      Anchors = [akTop, akLeft, akRight]
      BorderSpacing.Around = 8
      Caption = ' '
      ParentColor = False
    end
    object Image1: TImage
      Left = 6
      Height = 48
      Top = 6
      Width = 48
      Align = alLeft
      AutoSize = True
      BorderSpacing.Around = 6
      Center = True
      Picture.Data = {
        1754506F727461626C654E6574776F726B477261706869635907000089504E47
        0D0A1A0A0000000D494844520000003000000030080300000117DB3923000000
        097048597300005C4600005C4601149443410000000974455874436F6D6D656E
        740000892A8D060000023D504C5445FFFFFF1491FF6464646464646464641491
        FF6464646464641491FF6464646464646464646464641491FF1491FF1491FF64
        64646464646464646464646464641491FF6464646464641491FF646464646464
        1491FF6464646464646464641491FF6464646464646464646464646464641491
        FF6464646464641491FF6464646464646464641491FF6464641491FF64646464
        6464646464646464646464646464646464646464646464646464646464646464
        1491FF6464646464646464646464641491FF6464646464646464641491FF6464
        646464641491FF6464646464641491FF64646464646464646464646464646464
        64641491FF6464646464646464646464641491FF6464646464646464641491FF
        1491FF1491FF6464646464646464641491FF6464641491FF6464646464641491
        FF1491FF1491FF6464641491FF6464641491FF1592FF1692FF1793FF1893FF1A
        94FF1F96FF2197FF2198FF2398FF2499FF279AFF299BFF2A9BFF2C9CFF2E9EFF
        319FFF3EA5FF44A8FF52AEFF57B1FF5FB4FF63B6FF64646465B7FF6BBAFF72BD
        FF73BEFF74BEFF77C0FF7BC2FF7EC3FF83C5FF85C6FF8BC9FF90CCFF91CCFF93
        CDFF98CFFFA6D5FFA8D6FFB5DDFFB9DFFFBBDFFFBCE0FFBDE0FFBEE1FFBFE1FF
        C0E2FFC2E2FFC2E3FFC4E4FFC5E4FFC7E5FFC8E6FFC9E6FFCAE6FFCCE7FFCEE8
        FFD0E9FFD4EBFFD7ECFFD8EDFFD9EDFFDAEEFFDBEFFFDDEFFFDFF0FFE0F1FFE1
        F1FFE2F2FFE4F3FFE5F3FFE6F3FFE7F4FFE8F5FFEAF6FFECF6FFF9FCFFFAFDFF
        FCFEFFFDFEFFFEFFFFFFFFFF6F31C7800000006B74524E530001010204050607
        08090A0B0F10151B1C1E2224252627282A2D2E323334353A3A3E3F4142445052
        5658595A5C5C60616E7071727377787B84858693969DA3A6A7A7A8A9ACB0B3B6
        B8BAC6C6C7CACDCECFD3D5D7D8DADCDEDFE2E3E6E7E7E8E9EDEDEEF1F6F8FBFC
        FDFEFECE4056170000043649444154181985C1856355751CC6E10F1C60B811CA
        28A5914B0C464D3A554201252EAD4E62C0DD5EBB3B5EBBBBBB0BEC8EEFDFE6EF
        9C9DEBAECC781E800E12230C2804E775473C3B1450083015CE075A9BC91D5C75
        16EC566250B200EB09C9702E7492B35B99E91D24669EF4A4C4A87646B3415248
        62232D03E7EB8188903800DB87A11CBB329276BB6A6794E64CA334C96B68E934
        B9E5975291066392C3480F4BC731986E29244D601C465228C118DD7F4DE81709
        63A488382551A3CA7A293E96980598234A2A18C80CE3878329D847ED7DF459E4
        52B5893E2BECB3A9DBE49E8CC2445F0C6354DA0283DC45B2D84318A95C847297
        C31E039ECC081522543801DE4A9BE1900A11EA05CBCC74C34EE9DE88EB236E8C
        F85A12AC367825287924924F956C062F81262F84634A9E795FB929E0FDE47A7C
        06CC5661EF0058E7364A5DAE4DA590ADB5E7D268EC3627B5A5F4D33CAD634E2B
        A76BAABAB488463BECCE992DD0BAC6F624EAB21E6FA2EE1C7B0525FB2C18BC4A
        D2C10A70A99753E8F220D8A2D218B8D81349DA3D0A8E4BBAEDE9BB95CC83C326
        F11EB84CC94BF1B3722319E2C530CE3041B957E247E5BA61B761ABE18472AFC7
        F72A8C60B2C11B418537E31B15368047E365A0C2DBF1A50A87C06D78014325FD
        F682DE8D937A28AE92BAC11D783548FA35DEFC203E7B35E2766927783AB503A0
        E4F728DC21693E03DDC212C3662591BB5509AC34E059A05C44DCAC643DB80AEC
        374C512E6E50720C16BA09C8BC0B2AAA3B02C3BC9D5C9BD7C180BD2ACC8633DC
        43AF0B7C05C9F0CA789219764669AEBD36A330B5E62EFA64FB9C548F3A69E7EF
        96D69C6C1BCBBF19BB745BCDA5DAB6A563F90F59FB3E978E56AB475DDAD79EF1
        4FE676D9AEAD9D9AD1209BBAB666BB6B2EA7C92EB07DE50C4AC3C7572AE38753
        9A71A5EDF3331AB4F5D81736930C98BD570DF6CE1E40D27CA1DDD3465DB6DDDE
        358CA47244FD1CA9900CDB656FCF2834EDB717924C39A6D2F311F19DEA8E4D21
        5968EF6F2257B56791ACD75F5E8E889FD4673DC92CBB4AB2C45E49B2597D5E8B
        881FD46033C94A7B09B4D47C6020305F0DDE88886FD5683E30F0806B2D4CB757
        93EC5483B722E22B35DA49B2DA9ECE79F6026068B70AF73C7695A47722E29492
        BBEE51AFEEA1C002BB83367B19C92125D7FE14112F5EA7F722E20B5DFD5C248F
        2B77886499DDC6687B23C90615EEFB2D223EFC3C227EF82C92AFEF546103C946
        7B346CB52703234EA8D7837FC45F4EDEAE5E27460093EDADC0387B37C9846E95
        1E8B5E9FDCA252F70492DDF63892C5F69E21C0C8CB54F754447C7493EA2E1F09
        0CD9632FA6D06E1F1E4532EFB8EA1EBD5E75C7E7918C3A6CB7539AD8655F3488
        64CC169D66CB18924117D95D13E9B3DCF62567921B5C5975508583AB2A83C99D
        7989EDE5FC4DB6A2C7F6A6B3E9E79C4DB67B5664F4336987739D6B66B6B690B4
        B4CE5CD3E9DC8E49FC8BA645559FA6BAA889FFD3DC3A6D4E47C79C69ADCDF4F7
        270433537B755A99DA0000000049454E44AE426082
      }
      Transparent = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = CheckUpdateDownload
    Left = 344
    Top = 8
  end
end
