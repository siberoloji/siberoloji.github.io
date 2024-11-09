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
date: "2017-05-16T12:58:00Z"
excerpt: Bazen yapmak istediğiniz işleme tam olarak uyan bir modül bulamazsınız. 2-3
  farklı modülün yaptığı işlemleri tek modülde toplamak istersiniz. Örneğin, evinizdeki
  ağınızı zafiyetlere karşı taramak ve kayıt altına almak isteyebilirsiniz. Metasploit
  Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.
guid: https://www.siberoloji.com/?p=1159
id: 1159
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Kendi Tarayıcınızı Yazma
url: /tr/msf-icinde-kendi-tarayicinizi-yazma/
---

  Bazen yapmak istediğiniz işleme tam olarak uyan bir modül bulamazsınız. 2-3 farklı modülün yaptığı işlemleri tek modülde toplamak istersiniz. Örneğin, evinizdeki ağınızı zafiyetlere karşı taramak ve kayıt altına almak isteyebilirsiniz. Metasploit Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.
 

  Programlama diliyle söyleyecek olursak, Metasploit Framework içinde kullanılan bütün sınıflara (class) erişim ve kullanım imkanınız bulunmaktadır.
 

 
<h2 class="wp-block-heading" id="tarayıcıların-bazı-özellikleri">Tarayıcıların bazı özellikleri
<!-- /wp:heading -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Tüm exploit sınıf ve modüllerine erişim sağlarlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Proxy, SSL ve raporlama desteği bulunur. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Tarayıcı için THREAD yönetimi ve istenen aralıkta tarama desteği 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Yazması ve çalıştırması çok kolaydır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Yazması ve çalıştırması kolay dense de kodlama biliyor olmanız size çok zaman kazandıracaktır. Bunu da ifade edelim. Aşağıdaki örnekte, TCP Exploit Modülü,&nbsp;<code>include</code>&nbsp;komutu ile sisteme dahil edilmekte ve bu modülün TCP bağlantı değişkenleri, istenen IP adresine bağlanmak için kullanılmaktadır. 12345 Portuna bağlantı sağlandıktan sonra sunucuya “HELLO SERVE” mesajı gönderilmektedir. Son olarak da sunucunun verdiği cevap ekrana yazdırılmaktadır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">require 'msf/core'
class Metasploit3 &lt; Msf::Auxiliary
        include Msf::Exploit::Remote::Tcp
        include Msf::Auxiliary::Scanner
        def initialize
                super***(*** 
                        'Name'           ***=&gt;***  'My custom TCP scan',
                        'Version'        ***=&gt;***  '$Revision: 1 $',
                        'Description'    ***=&gt;***  'My quick scanner',
                        'Author'         ***=&gt;***  'Your name here',
                        'License'        ***=&gt;***  MSF_LICENSE
                ***)*** 
                register_options***(*** 
                        ***[*** 
                                Opt::RPORT***(*** 12345***)*** 
                        ***]*** , self.class***)*** 
        end

        def run_host***(*** ip***)*** 
                connect***()*** 
      greeting ***=***  "HELLO SERVER" 
      sock.puts***(*** greeting***)*** 
                data ***=***  sock.recv***(*** 1024***)*** 
                print_status***(*** "Received: #{data} from #{ip}"***)*** 
                disconnect***()*** 
        end
end
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yazdığınız-tarayıcıyı-kaydetme">Yazdığınız Tarayıcıyı Kaydetme
<!-- /wp:heading -->

  Yazdığınız tarayıcıyı doğru yere kaydetmelisiniz.&nbsp;<code>msfconsole</code>&nbsp;başlarken modüller&nbsp;<code>./modules/auxuliary/scanner</code>&nbsp;klasöründen yüklenirler. O zaman yeni yazdığımız modülü&nbsp;<code>./modules/auxiliary/scanner/http/</code>&nbsp;klsörünün için simple_tcp.rb dosya adıyla Ruby uzantılı kayıt etmeliyiz. Ayrıntılı bilgi için&nbsp;<a href="https://siberoloji.github.io/Metasploit-temel-komutlar-ve-acikalamalari/">Metasploit Temel Komutlar -loadpath-</a>&nbsp;başlığını okuyabilirsiniz.
 

  Deneyeceğimiz tarayıcı modülün mesajını yakalamak için&nbsp;<code>netcat</code>&nbsp;dinleme oturumu açabilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# nc -lnvp 12345 &lt; response.txt
listening on ***[*** any] 12345 ...
</code></pre>
<!-- /wp:code -->

  Ardından yeni modülü seçip RHOST değişkenini ayarlıyoruz ve modülü çalıştırıyoruz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use scanner/simple_tcp
msf auxiliary***(*** simple_tcp***)***  ***&gt;***  set RHOSTS 192.168.1.100
RHOSTS ***=&gt;***  192.168.1.100
msf auxiliary***(*** simple_tcp***)***  ***&gt;***  run

***[*** ******* ***]***  Received: hello metasploit from 192.168.1.100
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Detaylı kullanım örnekleri için Metasploit içerisinde bulunan modülleri incelemeniz tavsiye ediyorum.
 

 
<h2 class="wp-block-heading" id="sonuçları-kaydetme">Sonuçları Kaydetme
<!-- /wp:heading -->

  Raporlama metodu&nbsp;<code>report_*()</code>&nbsp;kullanıcıya aşağıdaki imkanları sunar. Bunun için veri tabanı kullanıyor olmalısınız.
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Veri tabanı bağlantısı olup olmadığını kontrol eder. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Çift kayıt olup olmadığını kontrol eder. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bulunan bir kaydı tabloya yazar. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  report.*() metodunu kullanmak için aşağıdaki&nbsp;<code>include</code>&nbsp;satırını tarayıcı dosyanıza dahil etmelisiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">include Msf::Auxiliary::Report
</code></pre>
<!-- /wp:code -->

  Son olarak report_note() metodunu kullanabilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">report_note***(*** 
:host ***=&gt;***  rhost,
:type ***=&gt;***  "myscanner_password",
:data ***=&gt;***  data
***)*** </code></pre>
<!-- /wp:code -->