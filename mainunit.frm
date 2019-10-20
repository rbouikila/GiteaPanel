object MainForm: TMainForm
  Left = 86
  Height = 409
  Top = 85
  Width = 480
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gitea Panel'
  ClientHeight = 409
  ClientWidth = 480
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poDefault
  ShowHint = True
  LCLVersion = '6.9'
  object ButtonPanel1: TButtonPanel
    Left = 6
    Height = 30
    Top = 373
    Width = 468
    OKButton.Name = 'OKButton'
    OKButton.DefaultCaption = True
    OKButton.OnClick = OKButtonClick
    HelpButton.Name = 'HelpButton'
    HelpButton.DefaultCaption = True
    CloseButton.Name = 'CloseButton'
    CloseButton.DefaultCaption = True
    CancelButton.Name = 'CancelButton'
    CancelButton.DefaultCaption = True
    TabOrder = 0
    ShowButtons = [pbOK, pbClose]
    ShowBevel = False
    object CoBoxLang: TComboBox
      Left = 0
      Height = 30
      Hint = 'Language preferences will be applied after restarting the application.'#10'Click "OK" to save the setting.'
      Top = 0
      Width = 208
      ItemHeight = 0
      OnChange = CoBoxLangChange
      ParentShowHint = False
      ShowHint = True
      Style = csDropDownList
      TabOrder = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 6
    Height = 152
    Top = 216
    Width = 468
    Caption = 'Browser'
    ClientHeight = 150
    ClientWidth = 466
    TabOrder = 1
    object RButtDefBrows: TRadioButton
      Left = 8
      Height = 23
      Top = 4
      Width = 192
      Caption = 'Open Gitea default browser'
      Checked = True
      OnClick = RButtBrowsChange
      TabOrder = 0
      TabStop = True
    end
    object RButtSelBrows: TRadioButton
      Tag = 1
      Left = 8
      Height = 23
      Top = 36
      Width = 146
      Caption = 'In selected browser:'
      OnClick = RButtBrowsChange
      TabOrder = 1
    end
    object RButtOterBrows: TRadioButton
      Tag = 2
      Left = 8
      Height = 23
      Top = 69
      Width = 113
      Caption = 'Other browser'
      OnClick = RButtBrowsChange
      TabOrder = 2
    end
    object Label2: TLabel
      Left = 136
      Height = 16
      Top = 72
      Width = 191
      Caption = 'Please enter your browser path.'
      ParentColor = False
    end
    object EditBrowsPath: TFileNameEdit
      Left = 8
      Height = 28
      Top = 96
      Width = 447
      FilterIndex = 0
      HideDirectories = False
      ButtonWidth = 28
      NumGlyphs = 1
      Images = ImageList1
      ImageIndex = 6
      Enabled = False
      MaxLength = 0
      Spacing = 0
      TabOrder = 3
      TextHint = 'Full path to your browser'
    end
    object CoBoxBrow: TComboBox
      Left = 208
      Height = 30
      Top = 32
      Width = 247
      Enabled = False
      ItemHeight = 0
      Style = csDropDownList
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Height = 200
    Top = 8
    Width = 468
    Caption = 'Gitea'
    ClientHeight = 198
    ClientWidth = 466
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Height = 16
      Top = 4
      Width = 71
      Caption = 'Gitea patch:'
      ParentColor = False
    end
    object EditGiteaPatch: TFileNameEdit
      Left = 8
      Height = 28
      Top = 24
      Width = 447
      FilterIndex = 0
      HideDirectories = False
      ButtonWidth = 28
      NumGlyphs = 1
      Images = ImageList1
      ImageIndex = 0
      Color = clDefault
      MaxLength = 0
      ParentColor = True
      Spacing = 0
      TabOrder = 0
      TextHint = 'Full path to Gitea'
    end
    object RButtDefPort: TRadioButton
      Left = 8
      Height = 23
      Top = 107
      Width = 101
      Caption = 'Default port'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RButtSpecPort: TRadioButton
      Left = 192
      Height = 23
      Top = 107
      Width = 110
      Caption = 'Specified port'
      OnChange = RButtPortChange
      TabOrder = 2
    end
    object EditPort: TSpinEdit
      Left = 344
      Height = 28
      Top = 104
      Width = 111
      Alignment = taRightJustify
      Enabled = False
      MaxValue = 100000
      MinValue = 80
      TabOrder = 3
      Value = 8080
    end
    object CoBoxProtocol: TComboBox
      Left = 72
      Height = 26
      Top = 65
      Width = 100
      AutoCompleteText = []
      AutoDropDown = True
      ItemHeight = 0
      Items.Strings = (
        'http://'
        'https://'
      )
      ParentColor = True
      ParentFont = False
      Style = csDropDownList
      TabOrder = 4
    end
    object Label3: TLabel
      Left = 8
      Height = 16
      Top = 70
      Width = 55
      Caption = 'Protocol:'
      ParentColor = False
    end
    object Label4: TLabel
      Left = 192
      Height = 16
      Top = 70
      Width = 31
      Caption = 'Host:'
      ParentColor = False
    end
    object EditHost: TEdit
      Left = 240
      Height = 28
      Top = 64
      Width = 215
      ParentColor = True
      TabOrder = 5
      TextHint = 'Default: localhost'
    end
    object CheckBoxUpdate: TCheckBox
      Left = 8
      Height = 23
      Hint = 'Check for Gitea updates at program startup.'
      Top = 145
      Width = 104
      Caption = 'Update Gitea'
      OnChange = CheckBoxUpdateChange
      TabOrder = 6
    end
    object CheckBoxAutoUpdate: TCheckBox
      Left = 192
      Height = 23
      Top = 145
      Width = 191
      Caption = 'Auto update (no questions)'
      Enabled = False
      TabOrder = 7
    end
    object BtnUpdSetting: TSpeedButton
      Left = 427
      Height = 28
      Hint = 'Update options.'
      Top = 144
      Width = 28
      Color = clDefault
      Enabled = False
      Images = ImageList1
      ImageIndex = 7
      OnClick = BtnUpdSettingClick
    end
  end
  object TrayIcon1: TTrayIcon
    PopUpMenu = PopupMenu1
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 256
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    TrackButton = tbLeftButton
    Left = 296
    Top = 16
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuOpenGitea: TMenuItem
      Caption = 'Open Gitea...'
      ImageIndex = 2
      OnClick = MenuOpenGiteaClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object MenuStartStop: TMenuItem
      ImageIndex = 0
      OnClick = MenuStartStopClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuSetting: TMenuItem
      Caption = 'Setting'
      ImageIndex = 3
      OnClick = MenuSettingClick
    end
    object MenuUpdate: TMenuItem
      Caption = 'Check update Gitea'
      ImageIndex = 8
      OnClick = MenuUpdateClick
    end
    object MenuAbout: TMenuItem
      Caption = 'About'
      ImageIndex = 4
      OnClick = MenuAboutClick
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object MenuClose: TMenuItem
      Caption = 'Close'
      ImageIndex = 5
      OnClick = MenuCloseClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
  end
  object ImageList1: TImageList
    Left = 328
    Top = 16
    Bitmap = {
      4C69090000001000000010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D2F15030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002795566026985EF0269960FF2699
      5FFF27975BFF26965AF926965CE126985FC28DBA9DBF26985FC326975CE12696
      5AF727975AFF26985EFF2794535B278F492126985EFF2795556F2893519A2699
      60FF269960FF269960FF269960FF269960FF8DBA9DFF269960FF269960FF2699
      60FF269960FF269960FF2894538026975F4226975CE600000000279659422699
      60FF269960FF269960FF269960FF7DB291FF92BDA2FF269960FF269960FF2699
      60FF269960FF269960FF26975B4C2795543F26985EFF288C4211278940132698
      5EFF269960FF269960FF6BAB85FFF8FAF9FFBDD4C5FFBDD4C5FF50A273FF2699
      60FF269960FF269960FF29904626144B230126975CDF26975BCA268F4F2B2697
      5BC5269960FF269960FFD0E0D6FFD8E5DDFFC8DCD0FFE9F1ECFFE0EAE4FF2699
      60FF269960FF26985DE6000000000000000028924E3026975BCC269960FF2699
      5FFF269960FF69AA83FFF2F6F3FFC7DACEFFF5F8F6FFDFEAE3FFAFCDBAFF2699
      60FF269960FF2796599500000000000000000000000000000000288D45282797
      5B4E26985EFE4BA171FFC9DCD0FFF0F5F1FFACCBB7FFF6F9F7FF3D9D6AFF2699
      60FF26995FFF2791512400000000000000000000000000000000000000000000
      000026955885269960FF269960FF64A980FFCDDED3FFA6C7B1FF269960FF2699
      60FF26965B9F0000000000000000000000000000000000000000000000000000
      0000030D06002796599D269960FF269960FF269960FF269960FF269960FF2796
      59C7298F42100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D2F15030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000143F4600046FCF00047FFFF0047
      FEFF0145FAFF0144F8F90045FAE10046FEC28994FFBF0046FEC30045FAE10144
      F8F70145F9FF0046FDFF0142F15B023EE7210046FDFF0143F36F0242EF9A0047
      FFFF0047FFFF0047FFFF0047FFFF0047FFFF8994FFFF0047FFFF0047FFFF0047
      FFFF0047FFFF0047FFFF0142F1800046FD420045FAE6000000000144F7420047
      FFFF0047FFFF0047FFFF0047FFFF7887FFFF909AFFFF0047FFFF0047FFFF0047
      FFFF0047FFFF0047FFFF0045FA4C0143F23F0046FCFF033CDD110238DE130046
      FDFF0047FFFF0047FFFF6779FFFFF8F8FFFFBCC1FFFFBBC1FFFF4762FFFF0047
      FFFF0047FFFF0047FFFF033EE4260103B7010046FBDF0145F9CA013FEC2B0045
      F9C50047FFFF0047FFFFCFD3FFFFD8DAFFFFCBCEFFFFEAEBFFFFE0E2FFFF0047
      FFFF0047FFFF0046FBE600000000000000000241EC300045FACC0047FFFF0047
      FEFF0047FFFF6376FFFFF2F3FFFFC6CAFFFFF5F6FFFFDFE1FFFFB0B7FFFF0047
      FFFF0047FFFF0144F79500000000000000000000000000000000023CE3280145
      F94E0046FDFE435FFFFFC9CDFFFFF0F1FFFFADB3FFFFF6F7FFFF3256FFFF0047
      FFFF0047FEFF0140EF2400000000000000000000000000000000000000000000
      00000143F6850047FFFF0047FFFF5F73FFFFCDD1FFFFA4ABFFFF0047FFFF0047
      FFFF0145F99F0000000000000000000000000000000000000000000000000000
      0000020804000144F79D0047FFFF0047FFFF0047FFFF0047FFFF0047FFFF0145
      F8C7033DE1100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006464642C646464A9636363CF6464
      64A3646464240000000000000000000000000000000000000000000000000000
      00000000000000000000000000006363633C646464F3646464FF646464FF6464
      64FF646464ED6464643400000000000000000000000000000000000000000000
      000000000000000000006363633A636363F3646464FF656565FF737373FF6464
      64FF646464FF646464EF64646426000000000000000000000000000000000000
      00000000000064646416636363ED646464FF727272FFE0E0E0FFFFFFFFFFD7D7
      D7FF666666FF646464FF646464A5000000000000000000000000000000000000
      0000000000006464646A646464FF747474FFC4C4DFFFCECEF3FFFFFFFFFFFFFF
      FFFF848484FF646464FF646464CF000000000000000000000000000000000000
      00000000000064646478767676FFA1A1D8FF0808C3FF0101C1FFCBCBF2FFF2F2
      F2FF6D6D6DFF646464FF646464A7000000000000000000000000646464186464
      646C636363788E8E8E78A0A0D9FF0707C2FF0000C1FF0606C2FFCCCCEAFF8282
      82FF646464FF646464F16464642800000000000000006464643C646464EF6464
      64FF797979FF9E9EDAFF0606C2FF0000C1FF0707C2FFA6A6E0FF808080FF6464
      64FF646464F36464643A00000000000000006464643A646464F3646464FF7B7B
      7BFF9C9CDAFF0505C2FF0000C1FF0808C3FFA8A8DFFF7E7E7EFF646464FF6464
      64EF6464643C000000000000000064646428646464F1646464FF7D7D7DFF9C9C
      DCFF0404C2FF0000C1FF0909C3FFAAAADEFF9696967C636363786464646C6464
      6418000000000000000000000000646464A7646464FF6C6C6CFFEFEFEFFF1616
      C6FF0000C1FF0A0AC3FFACACDEFF7A7A7AFF6464647800000000000000000000
      0000000000000000000000000000646464CF646464FF878787FFFFFFFFFF7575
      DDFF2A2ACBFFAEAEDDFF787878FF646464FF6464646A00000000000000000000
      0000000000000000000000000000646464A5646464FF696969FFE2E2E2FFFFFF
      FFFFE7E7E7FF767676FF646464FF636363ED6464641600000000000000000000
      000000000000000000000000000064646426646464EF646464FF676767FF7F7F
      7FFF686868FF646464FF636363F36363633A0000000000000000000000000000
      00000000000000000000000000000000000064646434646464ED646464FF6464
      64FF646464FF646464F36363633C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064646424646464A36363
      63CF646464A96464642C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064646412646464BB6464
      64CF636363AB6464644200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464406464
      64F1646464FF636363FF64646476000000000000000000000000000000000000
      0000000000000000000000000000636363346363630400000000000000006464
      6430636363EB646464FF646464FD6464642E0000000000000000000000000000
      0000000000000000000000000000646464B96464648700000000000000006464
      6402636363C7646464FF646464FF646464850000000000000000000000000000
      0000000000000000000000000000646464CD646464FD64646450646464006464
      6499646464FF646464FF646464FF646464990000000000000000000000000000
      0000000000000000000000000000646464A1646464FF646464FD646464EB6464
      64FF646464FF646464FF646464FF6464646C0000000000000000000000000000
      00000000000000000000000000006464642E636363F9646464FF646464FF6464
      64FF646464FF646464FF646464E557576F100000C1320000C10C000000000000
      0000000000000000000000000000000000006464644C636363ED646464FF6464
      64FF646464FF646464D94B4B7B3C0000C1C10000C1FF0000C1D90000C11A0000
      000000000000000000000000000000000000000000006363630E636363546363
      636C64646448646464040000C1990000C1FF0000C1FF0000C1FF0000C1D70000
      C118000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000C1C30000C1FF0000C1FF0000C1FF0000C1FF0000
      C1D30000C1160000000000000000000000000000000000000000000000000000
      000000000000000000000000C1300000C1ED0000C1FF0000C1FF0000C1FF0000
      C1FF0000C1D10000C11400000000000000000000000000000000000000000000
      00000000000000000000000000000000C1340000C1EF0000C1FF0000C1FF0000
      C1FF0000C1FF0000C1CF0000C112000000000000000000000000000000000000
      0000000000000000000000000000000000000000C1380000C1F10000C1FF0E0E
      C4FF6464D9FF0606C2FF0000C0A7000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000C13C0000C1F33A3A
      CFFFEDEDFAFF2323C9FF0000C1B9000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000C13E0000
      C1F50000C1FF0000C1E30000C124000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C12E0000C1720000C11A00000000000000000000000000000000000000006464
      640E64646462646464A9646464C7646464C7646464A9646464626464640E0000
      00000000000000000000000000000000000000000000000000006464645E6464
      64E9646464C164646472646464506464645064646472646464C1646464E96464
      645E000000000000000000000000000000000000000064646487636363DF6464
      643CFF911400FF911430FF911462FF911462FF911430FF9114006464643C6363
      63DF646464850000000000000000000000006464645E636363D964646414FF91
      1426FF9114C7FF9114FFFF9114FFFF9114FFFF9114FFFF9114C7FF9114266464
      6414636363D96464645E000000006464640E646464E56464642AFF911422FF91
      14EBFF9114FFFF9114FFFF9114FFFF9114FFFF9114FFFF9114FFFF9114EBFF91
      14226464642A646464E56464640E64646462646464A100000000FF9113BBFF91
      14FFFF9114FFFFA846FFFFDDB6FFFFE1BFFFFFB056FFFF9114FFFF9114FFFF91
      13BB00000000646464A164646462646464A96464644EFF911420FF9114FFFF91
      14FFFF9114FFFFF3E5FFFFE2C2FFFFDAB1FFFFFAF5FFFF941BFFFF9114FFFF91
      14FFFF9114206464644E646464A9646464C764646428FE90134EFF9114FFFF91
      14FFFF9114FFFF9318FFFF9E30FFFFCA8EFFFFFDFBFFFF9721FFFF9114FFFF91
      14FFFE90134E64646428646464C7646464C764646428FE90134EFF9114FFFF91
      14FFFF9114FFFF9114FFFFDCB5FFFFF6ECFFFFBA6BFFFF9114FFFF9114FFFF91
      14FFFE90134E64646428646464C7646464A96464644EFF911420FF9114FFFF91
      14FFFF9114FFFF9114FFFFBD72FFFFC17BFFFF9114FFFF9114FFFF9114FFFF91
      14FFFF9114206464644E646464A964646462646464A100000000FF9113BBFF91
      14FFFF9114FFFF9114FFFFD29FFFFFCE98FFFF9114FFFF9114FFFF9114FFFF91
      13BB00000000646464A1646464626464640E646464E56464642AFF911422FF91
      14EBFF9114FFFF9114FFFFCE96FFFFCA8FFFFF9114FFFF9114FFFF9114EBFF91
      14226464642A646464E56464640E000000006464645E646464D764646414FF91
      1426FF9114C7FF9114FFFF9114FFFF9114FFFF9114FFFF9114C7FF9114266464
      6414646464D76464645E00000000000000000000000064646487646464DD6464
      643CFF911400FF911430FF911462FF911462FF911430FF9114006464643C6464
      64DD6464648500000000000000000000000000000000000000006464645E6464
      64E9646464C164646472646464506464645064646472646464C1646464E96464
      645E000000000000000000000000000000000000000000000000000000006464
      640E64646462646464A9646464C7646464C7646464A9646464626464640E0000
      0000000000000000000000000000000000000000000000000000000000006464
      640E64646462646464A9646464C7646464C7646464A9646464626464640E0000
      00000000000000000000000000000000000000000000000000006464645E6464
      64E9646464C164646472646464506464645064646472646464C1646464E96464
      645E000000000000000000000000000000000000000064646487636363DF6464
      643C0000C1000000C1300000C1620000C1620000C1300000C1006464643C6363
      63DF646464850000000000000000000000006464645E636363D9646464140000
      C1260000C1C70000C1FF0000C1FF0000C1FF0000C1FF0000C1C70000C1266464
      6414636363D96464645E000000006464640E646464E56464642A0000C1220000
      C1EB0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1EB0000
      C1226464642A646464E56464640E64646462646464A1000000000000C1BB0000
      C1FF1616C6FF5959D6FF0000C1FF0000C1FF4242D1FF1E1EC8FF0000C1FF0000
      C1BB00000000646464A164646462646464A96464644E0000C1200000C1FF0000
      C1FF4848D2FFFEFEFEFF7F7FE0FF5F5FD8FFFCFCFEFF6B6BDBFF0000C1FF0000
      C1FF0000C1206464644E646464A9646464C7646464280000C04E0000C1FF0000
      C1FF0000C1FF7070DCFFFEFEFFFFFDFDFEFF9191E4FF0000C1FF0000C1FF0000
      C1FF0000C04E64646428646464C7646464C7646464280000C04E0000C1FF0000
      C1FF0000C1FF6868DAFFFEFEFEFFFEFEFFFF6F6FDCFF0000C1FF0000C1FF0000
      C1FF0000C04E64646428646464C7646464A96464644E0000C1200000C1FF0000
      C1FF4E4ED4FFFEFEFEFF8787E2FF8080E0FFFEFEFEFF5151D4FF0000C1FF0000
      C1FF0000C1206464644E646464A964646462646464A1000000000000C1BB0000
      C1FF1F1FC8FF6060D8FF0000C1FF0000C1FF6767DAFF2929CBFF0000C1FF0000
      C1BB00000000646464A1646464626464640E646464E56464642A0000C1220000
      C1EB0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1FF0000C1EB0000
      C1226464642A646464E56464640E000000006464645E646464D7646464140000
      C1260000C1C70000C1FF0000C1FF0000C1FF0000C1FF0000C1C70000C1266464
      6414646464D76464645E00000000000000000000000064646487646464DD6464
      643C0000C1000000C1300000C1620000C1620000C1300000C1006464643C6464
      64DD6464648500000000000000000000000000000000000000006464645E6464
      64E9646464C164646472646464506464645064646472646464C1646464E96464
      645E000000000000000000000000000000000000000000000000000000006464
      640E64646462646464A9646464C7646464C7646464A9646464626464640E0000
      000000000000000000000000000000000000000000000000000000000000E3A3
      670CE3A36762E3A367A5E2A367AFE3A36778E3A367ADE3A36768E3A3670A0000
      0000000000000000000000000000000000000000000000000000E2A36764E3A3
      677AE3A367FFE3A367FFE3A367FFE2A367AFE3A3676EE3A36774E3A3679DE3A3
      67640000000000000000000000000000000000000000E3A3668DE3A367FFE2A3
      67CBE3A367B1E3A367F1E3A36681E2A36778E3A26791E3A367C9E3A367FFE3A3
      67FFE3A3678D000000000000000000000000E3A36754E3A367FFE3A367FFE3A3
      67FFE2A3675EE3A2676EE3A367E1E3A367FFE3A367FFE3A3677EE3A367EDE3A3
      67FFE3A367EFE2A2662A00000000E3A3670EE3A3676CE3A367FFE3A367F5E3A3
      6778E2A3679BE2A3679BE3A367FFE3A367FFE3A367FFE3A367F1E2A36674E3A3
      67AFE2A3677CE3A366DDE3A3660EE2A36668E3A36789E3A367D5E2A36772E2A3
      66E9E3A367FFE3A36787E3A367EFE3A367FFE3A367FFE3A366E7E2A36758E3A2
      6785E3A367FFE3A367FFE2A36666E3A367ADE2A266BBE2A36754E3A367F9E3A3
      67FFE3A367FFE3A367EDE3A36789E3A367FFE3A367A3E3A36787E3A367F5E2A3
      676AE3A367FBE3A367FFE3A366ABE3A367B5E3A36787E3A36768E3A367FFE3A3
      67FFE3A367FFE3A367FFE3A36789E3A36770E3A367CDE3A367FFE3A367FFE3A3
      67C3E3A367A5E3A367FBE3A3676AE3A3666EE3A367FDE2A266A1E3A367C7E3A3
      67FFE3A367FDE3A36799E3A36791E3A3677CE3A367FFE3A367FFE3A367FFE3A3
      67FFE3A36768E3A36783E2A266BBE3A367A5E3A367FFE3A367FBE2A3676CE2A3
      67D5E3A36776E3A367D9E3A367FFE2A266ABE3A367CBE3A367FFE3A367FFE2A3
      67F7E3A3674EE3A367C1E3A367ADE2A36764E3A367FFE3A267F9E3A36762E3A3
      6770E3A367FDE3A367FFE3A367FFE2A367FFE3A36776E3A367FFE3A267E3E2A3
      6772E2A366D7E3A3678DE3A36768E2A3670AE3A367B5E3A3677AE3A367E5E3A3
      6774E3A367F3E3A367FFE3A367FFE3A367FFE3A367C3E3A36772E3A3677CE3A3
      67F7E3A367FFE3A3666AE3A3670E00000000E3A36744E3A367FFE3A367FFE3A3
      67EBE3A26781E3A367FFE3A367FFE3A367DDE3A3676CE2A36756E2A366FBE3A3
      67FFE3A367FFE3A36752000000000000000000000000E3A3678DE3A367FFE3A3
      67FFE2A367C9E3A3678FE2A36774E3A36787E2A366F5E3A367D9E3A36799E3A3
      67FFE3A2678D0000000000000000000000000000000000000000E3A36764E3A3
      6799E3A36774E2A36770E3A366B3E3A367FFE3A367FFE3A367FFE3A26781E2A3
      676200000000000000000000000000000000000000000000000000000000E3A3
      670CE3A36668E3A367ADE3A36776E3A367B1E3A366ABE3A36766E3A3670E0000
      0000000000000000000000000000000000000000000000000000000000006D24
      DA075F1BD8CD5F1BD8CD5F1BD8CD5F1BD8CD5F1BD8CD5F1BD8CD6D24DA070000
      000000000000000000000000000000000000000000000000000000000000551C
      E209601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF551CE2090000
      000000000000000000000000000000000000000000000000000000000000551C
      E209601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF551CE2090000
      000000000000000000000000000000000000000000000000000000000000551C
      E209601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF601BD8FF551CE2090000
      0000000000000000000000000000000000000000000000000000000000007F00
      BF04601BD789601BD7893D63E2F03D63E2F0601BD789601BD7897F00BF040000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000EC4F1DE0EC4F1DE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000EC4F1DE0EC4F1DE0000000000000000000000000000
      00000000000000000000000000000000000010C3F16F0EC4F1DE0EC4F1DE0EC4
      F1DE0EC4F1DE0EC4F1DE0FC4F0FB0FC4F0FB0EC4F1DE0EC4F1DE0EC4F1DE0EC4
      F1DE0EC4F1DE10C3F16F00000000000000000FC3F1800FC4F1FF0EC3F0E50EC4
      F1DE0EC4F1DE0EC4F1DE0FC4F0FB0FC4F0FB0EC4F1DE0EC4F1DE0EC4F1DE0EC3
      F0E50FC4F1FF0FC3F18000000000000000000FC3F1800FC4F1FF11C3F23C0000
      000000000000000000000EC4F1DE0EC4F1DE00000000000000000000000011C3
      F23C0FC4F1FF0FC3F18000000000000000000FC3F1800FC4F1FF11C3F23C0000
      000000000000000000000EC4F1DE0EC4F1DE00000000000000000000000011C3
      F23C0FC4F1FF0FC3F18000000000F395206DAFA360C48AAC82FFCD9D44A5F496
      1F49F39B2117F396218991AA7AF091AA7AF0F3962189F39B2117F4961F49CD9D
      44A58AAC82FFAFA360C4F395206DF29621CDF39621FFF39621FFF39621FFF396
      2189F394232BF39621FFF39621FFF39621FFF39621FFF394232BF3962189F396
      21FFF39621FFF39621FFF29621CDF29621CDF39621FFF39621FFF39621FFF396
      2189F394232BF39621FFF39621FFF39621FFF39621FFF394232BF3962189F396
      21FFF39621FFF39621FFF29621CDF29621CDF39621FFF39621FFF39621FFF396
      2189F394232BF39621FFF39621FFF39621FFF39621FFF394232BF3962189F396
      21FFF39621FFF39621FFF29621CDF29520A4F29621CDF29621CDF29621CDF395
      206DF0961E22F29621CDF29621CDF29621CDF29621CDF0961E22F395206DF296
      21CDF29621CDF29621CDF29520A4000000000000000000000000000000006464
      641064646468646464A0646464C0646464C0646464A064646468646464100000
      00000000000000000000000000000000000000000000000000006464645F6464
      64E5646464BA646464776464645A6464645A64646477646464BA646464E56464
      645F000000000000000000000000000000000000000064646484646464D86464
      64414D8B4B014B8A49374B8A496A4B8A496A4B8A49374D8B4B01646464416464
      64D8646464840000000000000000000000006464645E646464D3646464194B8A
      492B4B8A49C14B8A49FF4B8A49FF4B8A49FF4B8A49FF4B8A49C14B8A492B6464
      6419646464D36464645E0000000064646411646464E0646464304B8A49284B8A
      49E74B8A49FF4B8A49FFB0DBDBFFB0C8B7FF4B8A49FF4B8A49FF4B8A49E74B8A
      492864646430646464E064646411646464686464649D000000004B8A49B54B8A
      49FF4B8A49FF4B8A49FFD3F2FAFFD3DACCFF4B8A49FF4B8A49FF4B8A49FF4B8A
      49B5000000006464649D64646468646464A0646464574B8A49244B8A49FF4B8A
      49FF4B8A49FF4B8A49FFD3F2FBFFD3D9CBFF4B8A49FF4B8A49FF4B8A49FF4B8A
      49FF4B8A492464646457646464A0646464C16464642E4B8A49584B8A49FF4B8A
      49FF4B9463FF4B8A49FFD3F3FDFFD3D8C9FF4B8A49FF4B9058FF4B8A49FF4B8A
      49FF4B8A49586464642E646464C1646464C16464642E4B8A49584B8A49FF6FA2
      7CFFF0F9F9FF7CB2A1FFD3F4FEFFC6D7CDFFA5CDC6FFF0F6F3FF4B915DFF4B8A
      49FF4B8A49586464642E646464C1646464A0646464574B8A49244B8A49FF4B8A
      49FFA5C5B4FFF0FBFFFFF0FCFFFFF0FBFDFFFFFDFAFFA5BA9EFF4B8A49FF4B8A
      49FF4B8A492464646457646464A0646464686464649D000000004B8A49B54B8A
      49FF4B8A49FFA5C9BCFFFFFFFFFFF0FBFFFF7CB6A7FF4B8A49FF4B8A49FF4B8A
      49B5000000006464649D6464646864646411646464E0646464304B8A49284B8A
      49E74B8A49FF4B8A49FFA5CABEFF7CB5A6FF4B8A49FF4B8A49FF4B8A49E74B8A
      492864646430646464E064646411000000006464645E646464D3646464194B8A
      492B4B8A49C14B8A49FF4B8A49FF4B8A49FF4B8A49FF4B8A49C14B8A492B6464
      6419646464D36464645E00000000000000000000000064646484646464D86464
      64414D8B4B014B8A49374B8A496A4B8A496A4B8A49374D8B4B01646464416464
      64D86464648400000000000000000000000000000000000000006464645F6464
      64E5646464BA646464776464645A6464645A64646477646464BA646464E56464
      645F000000000000000000000000000000000000000000000000000000006464
      641064646468646464A0646464C0646464C0646464A064646468646464100000
      0000000000000000000000000000
    }
  end
  object UniqueInstance1: TUniqueInstance
    Enabled = True
    Identifier = 'GiPane_hhjjeKLJghfHk'
    Left = 368
    Top = 16
  end
end
